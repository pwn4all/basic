# &#35; tip of gdb

#### &#42; core file debugging
```bash

$ sudo vi /etc/security/limit.conf
.
.
#<domain>      <type>  <item>         <value>
*               -       core            unlimited

$ sudo cat /etc/sysctl.conf
#kernel.core_pattern = core.%e.%p.%t
kernel.core_pattern = core.%e.%p

$ sudo sysctl -p

###############################################
# %p: pid
# %s: signal number
# %t: UNIX time of dump
# %h: hostname
# %e: executable filename
###############################################



$ ulimit -c unlimited
$ ./filename $(cat payload1 )
Segmentation fault (core dumped)



$ gdb -core core-filenmae
.
.
#0 <0x00005555555551ad> in ?? ()     <- here is corruption pointer
gef> info reg
.
rbp   0x4141414141414141    0x4141414141414141   <- overflow data
.
rip   0x00005555555551ad    0x00005555555551ad

```




#### &#42; load specific libc
```bash
$ gdb ./vulnerable -q
GEF for linux ready, type `gef' to start, `gef config' to configure
94 commands loaded for GDB 9.2 using Python engine 3.8
[*] 2 commands could not be loaded, run `gef missing` to know why.
Reading symbols from ./vulnerable...
(No debugging symbols found in ./vulnerable)
gef➤  set environment LD_PRELOAD=./libc.so
gef➤
       

```


#### &#42; setting environment
```bash
gef> set env TEST=AAAAAAAAAA
gef> show env TEST
TEST = AAAAAAAAAA
gef>

```


#### &#42; input payload using stdin
```bash
gef> r < payload

gef> r < <(python -c 'print("A"*100)')


## input argv[n]
gef> r $(python -c 'print("A"*100)') $(python -c 'print("B"*100)')

```


#### &#42; debugging using gdbserver
```bash
#### 1) find process id
$ ps -ef|grep final-zero
user      4295  4292  0 01:45 pts/3    00:00:00 /opt/phoenix/i486/final-zero

#### 2) run gdbserver with target process id
$ gdbserver :8888 --attach 4295
Attached; pid = 4295
Listening on port 8888


#### 3) access gdbserver using gdb client
$ gdb -q
gef> set arch
auto               i386:intel         i386:x64-32        i386:x64-32:nacl   i386:x86-64:intel  i8086
i386               i386:nacl          i386:x64-32:intel  i386:x86-64        i386:x86-64:nacl
gef> set arch i386
The target architecture is assumed to be i386
gef> 
gef> target remote 127.0.0.1:8888
Remote debugging using 127.0.0.1:8888
Reading /opt/phoenix/i486/final-zero from remote target...
warning: File transfers from remote targets can be slow. Use "set sysroot" to access files locally instead.
Reading /opt/phoenix/i486/final-zero from remote target...
Reading symbols from target:/opt/phoenix/i486/final-zero...(no debugging symbols found)...done.
Reading /opt/phoenix/i486-linux-musl/lib/ld-musl-i386.so.1 from remote target...
Reading symbols from target:/opt/phoenix/i486-linux-musl/lib/ld-musl-i386.so.1...done.
Reading /opt/phoenix/i486-linux-musl/lib/ld-musl-i386.so.1 from remote target...


#### 4) start debugging
gef> x/32xw $ebp-0x210
0xffffd4d8:	0x90909090	0x90909090	0x90909090	0x90909090
0xffffd4e8:	0x90909090	0x90909090	0x90909090	0x90909090
0xffffd4f8:	0x90909090	0x90909090	0x90909090	0x90909090
0xffffd508:	0x90909090	0x90909090	0x90909090	0x90909090
0xffffd518:	0x90909090	0x90909090	0x90909090	0x90909090
0xffffd528:	0x90909090	0x90909090	0x90909090	0x90909090
0xffffd538:	0x90909090	0x90909090	0x90909090	0x90909090
0xffffd548:	0x90909090	0x90909090	0x90909090	0x90909090
gef>

```


#### &#42; debugging attach pid
```bash
#### 1) find process id
$ ps -ef|grep final-zero
user      4295  4292  0 01:45 pts/3    00:00:00 /opt/phoenix/i486/final-zero

#### 2) run gdb with target process id

$ gdb -q [/opt/phoenix/i486/final-zero] -p 4295

or 

$ gdb -q
gef> attach 4295

```
