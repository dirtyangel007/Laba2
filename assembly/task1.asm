section .data
    prompt db "Введите число: ", 0
    prompt_len equ $ - prompt

    buffer resb 4
    newline db 10

section .bss
    num resb 4

section .text
    global _start

_start:
    ; Печать приглашения
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, prompt_len
    int 0x80

    ; Чтение ввода (число от пользователя)
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, 4
    int 0x80

    ; Преобразуем ASCII -> int
    mov ecx, buffer
    xor eax, eax
    xor ebx, ebx
read_digit:
    mov bl, byte [ecx]
    cmp bl, 10
    je input_done
    sub bl, '0'
    imul eax, eax, 10
    add eax, ebx
    inc ecx
    jmp read_digit

input_done:
    mov esi, eax       ; сохраняем n в esi
    mov edi, eax       ; также сохраним n для расчетов

print_loop:
    cmp esi, 0
    je exit

    mov ecx, esi
    mov ebx, edi
    sub ebx, esi
    add ebx, 'A'

inner_loop:
    mov edx, 1
    push ecx
    mov al, bl
    mov [buffer], al
    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    int 0x80
    pop ecx

    inc bl
    loop inner_loop

    ; Печать новой строки
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    dec esi
    jmp print_loop

exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80
