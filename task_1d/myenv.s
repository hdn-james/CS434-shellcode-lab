section .text
  global _start
    _start:
      ; Store the argument string on stack

      xor  eax, eax 
      push eax             
	push "/env"
      push "/bin"
	push "/usr"
      mov  ebx, esp     

	push "4"
	push "=123"
	push "cccc"
	mov esi, esp

	push eax
	push "5678"
	push "bbb="
	mov edx, esp

	push eax
	push "1234"
	push "aaa="
	mov edi, esp

      ; Construct the argument array argv[]
      push eax          
      push ebx          
      mov  ecx, esp     
   
      ; For environment variable 
	push esi	
	push edx	
	push edi	
	mov edx, esp	

      ; Invoke execve()
      xor  eax, eax     
      mov   al, 0x0b    
      int 0x80