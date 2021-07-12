section .text
global _start
  _start:
    ; The following code calls execve("/bin/sh", ...)
    xor rdx, rdx            ; 3rd argument (stored in rdx)
    push rdx
    mov rax,’/bin//sh’
    push rax
    mov rdi, rsp            ; 1st argument (stored in rdi)
    push rdx
    push rdi
    mov rsi, rsp            ; 2nd argument (stored in rsi)
    xor rax, rax
    mov al, 0x3b            ; execve()
    syscall
