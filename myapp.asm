BITS 32

import myfunc mydll.dll
import ExitProcess kernel32.dll

EXTERN myfunc
EXTERN ExitProcess

segment .code USE32

..start:
	call [myfunc]

exit:
	push dword 0
	call [ExitProcess]