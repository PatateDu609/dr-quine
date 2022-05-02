default rel
extern dprintf

%macro open 0

mov rdi, kid_name
mov rsi, 0o100 | 0o1 | 0o1000
mov rdx, 0o644
mov rax, 2
syscall

%endmacro

%macro print 1

push rbp

mov rdi, %1
mov rsi, fmt
mov rdx, 10
mov rcx, 34
mov r8, fmt
mov r9, 37
call dprintf

pop rbp

%endmacro

%macro main 0
global main

main:
open ; This will be replaced by the macro open

mov r11, rax
print rax

mov rdi, r11
mov rax, 3
syscall

mov rax, 0
ret

%endmacro

main

section .data
kid_name: db "Grace_kid.s",0
fmt: db "default rel%1$cextern dprintf%1$c%1$c%4$cmacro open 0%1$c%1$cmov rdi, kid_name%1$cmov rsi, 0o100 | 0o1 | 0o1000%1$cmov rdx, 0o644%1$cmov rax, 2%1$csyscall%1$c%1$c%4$cendmacro%1$c%1$c%4$cmacro print 1%1$c%1$cpush rbp%1$c%1$cmov rdi, %4$c1%1$cmov rsi, fmt%1$cmov rdx, 10%1$cmov rcx, 34%1$cmov r8, fmt%1$cmov r9, 37%1$ccall dprintf%1$c%1$cpop rbp%1$c%1$c%4$cendmacro%1$c%1$c%4$cmacro main 0%1$cglobal main%1$c%1$cmain:%1$copen ; This will be replaced by the macro open%1$c%1$cmov r11, rax%1$cprint rax%1$c%1$cmov rdi, r11%1$cmov rax, 3%1$csyscall%1$c%1$cmov rax, 0%1$cret%1$c%1$c%4$cendmacro%1$c%1$cmain%1$c%1$csection .data%1$ckid_name: db %2$cGrace_kid.s%2$c,0%1$cfmt: db %2$c%3$s%2$c, 0%1$c", 0
