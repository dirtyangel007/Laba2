section .data
    nums dd 3, 27, 14, 99
    nums_len equ 4
    result_msg db "Результат: ", 0
    result_msg_len equ $ - result_msg
    newline db 10
    digits db "0123456789"

section .bss
    index_str resb 10

section .text
    global _start

_start:
    ; Печатаем заголовок
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, result_msg_len
    int 0x80

    xor ecx, ecx        ; индекс по массиву

loop_start:
    cmp ecx, nums_len
    je done

    mov eax, [nums + ecx*4]
    push eax            ; сохраняем оригинал
    call sum_digits     ; eax = сумма
    mov esi, eax        ; сохраняем сумму
    pop eax
    push eax
    call prod_digits    ; eax = произведение
    mov edi, eax        ; произведение
    pop eax

    cmp esi, edi
    jge skip            ; если сумма >= произведения, пропускаем

    ; Выводим позицию (ecx + 1)
    mov eax, ecx
    add eax, 1
    call int_to_str
    mov eax, 4
    mov ebx, 1
    mov ecx, index_str
    mov edx, eax
    int 0x80

    ; Печатаем пробел
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

skip:
    inc ecx
    jmp loop_start

done:
    ; Печатаем перенос строки и выходим
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80

; ===== Сумма цифр
sum_digits:
    xor ebx, ebx        ; сумма = 0
.sum_loop:
    xor edx, edx
    mov ecx, 10
    div ecx
    add ebx, edx
    test eax, eax
    jnz .sum_loop
    mov eax, ebx
    ret

; ===== Произведение цифр
prod_digits:
    mov ebx, 1          ; произведение = 1
.prod_loop:
    xor edx, edx
    mov ecx, 10
    div ecx
    test edx, edx
    jz .skip_zero
    imul ebx, edx
.skip_zero:
    test eax, eax
    jnz .prod_loop
    mov eax, ebx
    ret

; ===== Целое число в строку
int_to_str:
    mov esi, index_str
    add esi, 10
    mov byte [esi], 0
    mov ecx, 0

.revloop:
    xor edx, edx
    mov ebx, 10
    div ebx
    dec esi
    add dl, '0'
    mov [esi], dl
    inc ecx
    test eax, eax
    jnz .revloop

    mov edi, index_str
    mov eax, ecx
    mov ecx, esi
    rep movsb
    mov eax, ecx
    ret
