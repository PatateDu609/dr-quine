default rel

extern dprintf
extern sprintf
extern system
extern strcmp
global main

section .text
main:
cmp DWORD[nb], 0
jle exit

push rbp
call should_decrease
pop rbp

push rbp
call set_name
pop rbp

mov rax, 2
mov rdi, filename
mov rsi, 0o100 | 0o1 | 0o1000
mov rdx, 0o644
syscall
cmp rax, -1
je exit_error

mov r11, rax
push r11
push rbp

mov rdi, r11
mov rsi, fmt
mov rdx, 10
mov rcx, 34
mov r8, 37
mov r9d, DWORD[nb]
mov r10, fmt
push r10
call dprintf
pop r10

pop rbp
pop r11

mov rax, 3
mov rdi, r11
syscall

push rbp
call compile
pop rbp

push rbp
call run
pop rbp

exit:
mov rax, 0
ret

exit_error:
mov rax, 1
ret

should_decrease:
push rbp
mov rdi, current_filename
mov rsi, fmt_decrease
mov edx, DWORD[nb]
call sprintf
pop rbp

push rbp
mov rdi, current_filename
mov rsi, actual_filename
mov rax, 0
call strcmp
pop rbp

cmp rax, 0
jnz return
dec DWORD[nb]

return:
ret

set_name:
push rbp
mov rdi, filename
mov rsi, fmt_decrease
mov edx, DWORD[nb]
call sprintf
pop rbp

push rbp
mov rdi, exec_filename
mov rsi, run_fmt
mov edx, DWORD[nb]
call sprintf
pop rbp

push rbp
mov rdi, obj_filename
mov rsi, obj_fmt
mov edx, DWORD[nb]
call sprintf
pop rbp
ret

compile:
push rbp
mov rdi, comp_cmd
mov rsi, comp_fmt
mov rdx, filename
mov rcx, exec_filename
mov r8, obj_filename
call sprintf
pop rbp

push rbp
mov rdi, comp_cmd
call system
pop rbp
ret

run:
push rbp
mov rdi, exec_filename
call system
pop rbp
ret

section .data
nb: dd 5
current_filename: times 100 db 0
filename: times 100 db 0
exec_filename: times 100 db 0
obj_filename: times 100 db 0
comp_cmd: times 1000 db 0

section .rodata
fmt: db "default rel%1$c%1$cextern dprintf%1$cextern sprintf%1$cextern system%1$cextern strcmp%1$cglobal main%1$c%1$csection .text%1$cmain:%1$ccmp DWORD[nb], 0%1$cjle exit%1$c%1$cpush rbp%1$ccall should_decrease%1$cpop rbp%1$c%1$cpush rbp%1$ccall set_name%1$cpop rbp%1$c%1$cmov rax, 2%1$cmov rdi, filename%1$cmov rsi, 0o100 | 0o1 | 0o1000%1$cmov rdx, 0o644%1$csyscall%1$ccmp rax, -1%1$cje exit_error%1$c%1$cmov r11, rax%1$cpush r11%1$cpush rbp%1$c%1$cmov rdi, r11%1$cmov rsi, fmt%1$cmov rdx, 10%1$cmov rcx, 34%1$cmov r8, 37%1$cmov r9d, DWORD[nb]%1$cmov r10, fmt%1$cpush r10%1$ccall dprintf%1$cpop r10%1$c%1$cpop rbp%1$cpop r11%1$c%1$cmov rax, 3%1$cmov rdi, r11%1$csyscall%1$c%1$cpush rbp%1$ccall compile%1$cpop rbp%1$c%1$cpush rbp%1$ccall run%1$cpop rbp%1$c%1$cexit:%1$cmov rax, 0%1$cret%1$c%1$cexit_error:%1$cmov rax, 1%1$cret%1$c%1$cshould_decrease:%1$cpush rbp%1$cmov rdi, current_filename%1$cmov rsi, fmt_decrease%1$cmov edx, DWORD[nb]%1$ccall sprintf%1$cpop rbp%1$c%1$cpush rbp%1$cmov rdi, current_filename%1$cmov rsi, actual_filename%1$cmov rax, 0%1$ccall strcmp%1$cpop rbp%1$c%1$ccmp rax, 0%1$cjnz return%1$cdec DWORD[nb]%1$c%1$creturn:%1$cret%1$c%1$cset_name:%1$cpush rbp%1$cmov rdi, filename%1$cmov rsi, fmt_decrease%1$cmov edx, DWORD[nb]%1$ccall sprintf%1$cpop rbp%1$c%1$cpush rbp%1$cmov rdi, exec_filename%1$cmov rsi, run_fmt%1$cmov edx, DWORD[nb]%1$ccall sprintf%1$cpop rbp%1$c%1$cpush rbp%1$cmov rdi, obj_filename%1$cmov rsi, obj_fmt%1$cmov edx, DWORD[nb]%1$ccall sprintf%1$cpop rbp%1$cret%1$c%1$ccompile:%1$cpush rbp%1$cmov rdi, comp_cmd%1$cmov rsi, comp_fmt%1$cmov rdx, filename%1$cmov rcx, exec_filename%1$cmov r8, obj_filename%1$ccall sprintf%1$cpop rbp%1$c%1$cpush rbp%1$cmov rdi, comp_cmd%1$ccall system%1$cpop rbp%1$cret%1$c%1$crun:%1$cpush rbp%1$cmov rdi, exec_filename%1$ccall system%1$cpop rbp%1$cret%1$c%1$csection .data%1$cnb: dd %4$d%1$ccurrent_filename: times 100 db 0%1$cfilename: times 100 db 0%1$cexec_filename: times 100 db 0%1$cobj_filename: times 100 db 0%1$ccomp_cmd: times 1000 db 0%1$c%1$csection .rodata%1$cfmt: db %2$c%5$s%2$c, 0%1$cfmt_decrease: db %2$cSully_%3$cd.s%2$c, 0%1$ccomp_fmt: db %2$cnasm -felf64 %3$cs && gcc -no-pie -lc -o %3$cs %3$cs%2$c, 0%1$crun_fmt: db %2$c./Sully_%3$cd%2$c, 0%1$cobj_fmt: db %2$cSully_%3$cd.o%2$c, 0%1$cactual_filename: db __FILE__, 0%1$c", 0
fmt_decrease: db "Sully_%d.s", 0
comp_fmt: db "nasm -felf64 %s && gcc -no-pie -lc -o %s %s", 0
run_fmt: db "./Sully_%d", 0
obj_fmt: db "Sully_%d.o", 0
actual_filename: db __FILE__, 0
