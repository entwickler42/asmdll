BITS 32

%define MB_OK 0

import MessageBoxA user32.dll
import MB_OK kernel32.dll
import ExitProcess kernel32.dll

export myfunc myfunc

EXTERN MessageBoxA
EXTERN ExitProcess

global ..start
global myfunc


section .data USE32

msg 	db 'Hello World !',0
msg_2 	db 'Dll Loaded !',0
msg_3 	db 'Dll Unloaded !',0
titel	db 'Meldung:',0
endl	db 0xD,0xA,'$'


section .bss USE32

reason resw	2


section .code USE32

..start:
	push eax

	mov eax, dword [reason]
	cmp eax, 0x0
	jne unload	
	mov eax, 0x01
	mov [reason], eax
	
	push dword MB_OK
	push titel
	push msg_2
	push dword 0

	call [MessageBoxA]

	jmp end_dll
unload:
	push dword MB_OK
	push titel
	push msg_3
	push dword 0

	call [MessageBoxA]

end_dll:
	pop eax
	ret	


myfunc:
	push dword MB_OK
	push titel
	push msg
	push dword 0

	call [MessageBoxA]
	ret	

exit:
	push dword 0
	call [ExitProcess]	