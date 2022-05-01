default rel ; Global scope
extern printf
global main

section .rodata
fmt: db "default rel ; Global scope%1$cextern printf%1$cglobal main%1$c%1$csection .rodata%1$cfmt: db %2$c%3$s%2$c, 0%1$c%1$csection .text%1$cprint_self:%1$cpush rbp%1$c%1$cmov rdi, fmt%1$cmov rsi, 10%1$cmov rdx, 34%1$cmov rcx, fmt%1$ccall printf wrt ..plt%1$c%1$cpop rbp%1$cret%1$c%1$cmain:%1$cpush rbp%1$ccall print_self%1$cpop rbp%1$c%1$cmov rax, 0%1$cret%1$c", 0

section .text
print_self:
push rbp

mov rdi, fmt
mov rsi, 10
mov rdx, 34
mov rcx, fmt
call printf wrt ..plt

pop rbp
ret

main:
push rbp
call print_self
pop rbp

mov rax, 0
ret
