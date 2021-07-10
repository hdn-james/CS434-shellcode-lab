section .text
  global _start
	
    _start:
			BITS 32
			jmp short two

    one:
			pop ebx
			xor eax, eax
			mov [ebx+12], al
			mov [ebx+17], al
			mov [ebx+22], al
			mov [ebx+27], eax

			mov [ebx+23], ebx
			
			lea edx, [ebx+13]	
			mov [ebx+31], edx	

			lea edx, [ebx+18]	
			mov [ebx+35], edx	

			mov [ebx+39], eax	
			xor edx, edx

			lea ecx, [ebx+23]	
			lea edx, [ebx+31]	

			mov al,  0x0b
			int 0x80,

     two:
			call one
			db '/usr/bin/env*a=11*b=22*arg0****env0env1****'