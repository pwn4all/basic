# &#35; how to use gdb

#### &#42; core file debugging
```bash

$ sudo vi /etc/security/limit.conf
.
.
#<domain>      <type>  <item>         <value>
*               -       core            unlimited

$ sudo /etc/sysctl.conf
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
