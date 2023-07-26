; fib.asm
section .data
    format_out db "%d", 10, 0   ; Format string for printing an integer with a newline

section .bss
    n       resd 1             ; Variable n (to store user input)
    a       resd 1             ; Variable a (initialized to 0)
    b       resd 1             ; Variable b (initialized to 1)
    c       resd 1             ; Variable c
    i       resd 1             ; Loop counter i

section .text
    global _start

_start:
    ; Call the C main function from assembly
    call main

    ; Exit the program
    mov rax, 60                 ; Syscall number for sys_exit
    xor edi, edi                ; Return status 0
    syscall

; Assembly version of fib function (same as before)
global fib

fib:
    ; Calculate the nth Fibonacci number
    xor eax, eax                ; Clear eax to 0 (a)
    mov ebx, 1                  ; Initialize ebx to 1 (b)
    mov dword [i], 2            ; Initialize i to 2

fib_loop:
    cmp dword [i], edi          ; Compare i with n (user input)
    jnbe fib_done               ; If i > n, exit the loop

    ; Calculate the next Fibonacci number
    mov edx, eax                ; edx = a
    add eax, ebx                ; eax = a + b
    mov dword [c], eax          ; c = a + b
    mov eax, ebx                ; a = b
    mov ebx, dword [c]          ; b = c

    inc dword [i]               ; Increment i
    jmp fib_loop                ; Repeat the loop

fib_done:
    ret

; External C functions
extern printf
extern main

