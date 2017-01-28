@ECHO OFF

erase mydll.obj
erase mydll.dll
erase myapp.obj
erase myapp.exe

nasmw -f obj mydll.asm -o mydll.obj
alink -c -oPE mydll.obj -dll

nasmw -f obj myapp.asm -o myapp.obj
alink -c -oPE myapp.obj

pause

