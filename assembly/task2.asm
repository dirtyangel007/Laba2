section .data
    nums dd 1224, 34455, 1, 8, 17596
    nums_len equ 5
    result_msg db "Результат: ", 0
    result_msg_len equ $ - result_msg
    newline db 10
    digits db "0123456789"

section .bss
    count resb 1
    str_num resb 10

section .text
    global _start

_start:
    xor ecx, ecx         ; индекс в массиве
    xor edi, edi         ; счётчик чисел с нечётным количеством цифр

loop_nums:
    cmp ecx, nums_len
    je print_result

    mov eax, [nums + ecx*4]
    call count_digits
    test al, 1           ; проверка на нечётность
    jz skip
    inc edi

skip:
    inc ecx
    jmp loop_nums

print_result:
    ; Печатаем сообщение
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, result_msg_len
    int 0x80

    ; Печатаем значение (edi)
    mov eax, edi
    call int_to_str
    mov eax, 4
    mov ebx, 1
    mov ecx, str_num
    mov edx, eax          ; длина строки возвращается в eax
    int 0x80

    ; Перенос строки
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Выход
    mov eax, 1
    xor ebx, ebx
    int 0x80

; Подсчёт количества цифр в eax
count_digits:
    mov ebx, eax
    cmp ebx, 0
    jne count_loop
    mov al, 1
    ret

count_loop:
    xor ecx, ecx
.count:
    inc ecx
    mov edx, 0
    mov eax, ebx
    mov ebx, 10
    div ebx
    mov ebx, eax
    cmp ebx, 0
    jne .count
    mov al, cl
    ret

; Преобразование числа в строку (edi = число)
int_to_str:
    mov esi, str_num
    add esi, 10
    mov byte [esi], 0
    mov eax, edi
    mov ecx, 0

.revloop:
    xor edx, edx
    mov ebx, 10
    div ebx
    dec esi
    mov bl, dl
    add bl, '0'
    mov [esi], bl
    inc ecx
    test eax, eax
    jnz .revloop

    mov eax, ecx
    mov ecx, esi
    mov edi, str_num
    rep movsb
    mov eax, ecx
    ret
