# &#35; patch binary

#### &#42; 1. how to open and save file
```bash
## first backup
$ cp binary binary_patch

## using -b option is important
$ vi -b binary_patch
:%!xxd


## -r option is very very important
:%!xxd -r

:wq

```


#### &#42; 2-1. find machine code using pwntools 
```bash
## want to find 'xor eax, eax'
## can find '0x31, 0cc0' in xxd mode on vi.
>>> from pwn import *
>>> asm('xor eax, eax')
[!] Your local binutils won't be used because architecture 'i686' is not supported.
'1\xc0'
>>> machine_codes=asm('xor eax, eax')
>>> for machine_code in machine_codes:
...     print hex(ord(machine_code))
...
0x31
0xc0


## can find '0x31, 0cc0' in xxd mode on vi.
$ objdump -d -j .text -M intel ./speedrun-006 | grep 0000000000000ab2 -A30
0000000000000ab2 <main>:
 ab2:	55                   	push   rbp
 ab3:	48 89 e5             	mov    rbp,rsp
 ab6:	48 83 ec 70          	sub    rsp,0x70
 aba:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
 abd:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
 ac1:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
 ac8:	00 00
 aca:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
 ace:	31 c0                	xor    eax,eax
 ad0:	48 8b 05 81 15 20 00 	mov    rax,QWORD PTR [rip+0x201581]        # 202058 <stdout@@GLIBC_2.2.5>
 ad7:	b9 00 00 00 00       	mov    ecx,0x0
 adc:	ba 02 00 00 00       	mov    edx,0x2
 ae1:	be 00 00 00 00       	mov    esi,0x0
 ae6:	48 89 c7             	mov    rdi,rax
 ae9:	e8 82 fc ff ff       	call   770 <setvbuf@plt>
 aee:	48 8d 3d 32 01 00 00 	lea    rdi,[rip+0x132]        # c27 <_IO_stdin_used+0x67>
 af5:	e8 06 fc ff ff       	call   700 <getenv@plt>
 afa:	48 85 c0             	test   rax,rax
 afd:	75 0a                	jne    b09 <main+0x57>
 aff:	bf 05 00 00 00       	mov    edi,0x5                  => 5 seconds
 b04:	e8 47 fc ff ff       	call   750 <alarm@plt>          =>  patch this point
 b09:	48 8d 45 90          	lea    rax,[rbp-0x70]
 b0d:	48 89 c7             	mov    rdi,rax
 b10:	b8 00 00 00 00       	mov    eax,0x0
 b15:	e8 80 fd ff ff       	call   89a <say_hello>
 b1a:	b8 00 00 00 00       	mov    eax,0x0
 b1f:	e8 f3 fe ff ff       	call   a17 <get_that_shellcode>
 b24:	b8 00 00 00 00       	mov    eax,0x0
 b29:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
 b2d:	64 48 33 14 25 28 00 	xor    rdx,QWORD PTR fs:0x28


## change 'e8 47 fc ff ff'(alarm@plt) to '31 c0 90 90 90'(xor eax eax)
$ vi -b speedrun-006-alarm
:%!xxd

## before
00000b00: 0500 0000 e847 fcff ff48 8d45 9048 89c7  .....G...H.E.H..

## after
00000b00: 0500 0000 31c0 9090 9048 8d45 9048 89c7  ....1....H.E.H..

:%!xxd -r

:wq!

```


#### &#42; 2-2. patch direct using command
```bash
## have to find unique string (want to change)
$ xxd binary | sed 's/e847 fcff ff48/31c0 9090 9048/g' | xxd -r > binary_patch
$ sed -i s/fork/sync/ binary_patch

```


#### &#42; 2-3. patch direct using command (x86(32bit))
```bash
# remove any pesky alarms
sed -i s/alarm/isnan/ binary_patched
sed -i s/alarm/isnanf/ binary_patched
mkdir /tmp/justify

###################################
#include <math.h>
#int isnan ( double x );
#int isnanf ( float x );    [+] don't change because isnanf is 6 chars but alarm is 5 char
###################################
#include <unistd.h>
#unsigned alarm(unsigned seconds);
###################################

```


#### &#42; 2-4. patch direct using command (x64(64bit))
## change syscall (0f 05) to NOP(90)
|  \   | machine code
|:---: | :---:
| before | 000498c0: 0dfb bf04 0048 8d35 eebe 0400 488d 3d00  .....H.5....H.=.<br>
000498d0: bf04 00ba 8e00 0000 e803 83fb ff0f 1f00  ................<\br>
000498e0: b825 0000 000f 0548 3d01 f0ff ff73 01c3  .%.....H=....s..<\br>
000498f0: 48c7 c1c0 ffff fff7 d864 8901 4883 c8ff  H........d..H...<\br>
00049900: c366 2e0f 1f84 0000 0000 000f 1f44 0000  .f...........D..
| after | 000498c0: 0dfb bf04 0048 8d35 eebe 0400 488d 3d00  .....H.5....H.=.<\br>
000498d0: bf04 00ba 8e00 0000 e803 83fb ff0f 1f00  ................<\br>
000498e0: b825 0000 0090 9048 3d01 f0ff ff73 01c3  .%.....H=....s..<\br>
000498f0: 48c7 c1c0 ffff fff7 d864 8901 4883 c8ff  H........d..H...




#### &#42; change path
```bash
## use /tmp instead of /home
/  =>  \\/
$ sed -i s/home/\\/tmp/ justify > justify_patched

$ strings crack|grep flag
cat /home/crack/flag

$ sed -i s/home\\/crack/ctf\\/\\/\\/\\/\\/\\/\\// crack
$ strings crack|grep flag
cat /ctf////////flag

```
