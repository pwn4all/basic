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
$ ./vulnerable $(cat payload1 )
Segmentation fault (core dumped)

$ gdb -core core
.
.
#0 <0x00005555555551ad> in ?? ()     <- here is corruption pointer
gef> info reg
.
rbp   0x4141414141414141    0x4141414141414141   <- overflow data
.
rip   0x00005555555551ad    0x00005555555551ad

```
