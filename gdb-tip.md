# &#35; how to use gdb

#### &#42; core file debugging
```bash

$ gdb -core corefile
.
.
#0 <0x00005555555551ad> in ?? ()     <- here is corruption pointer
gef> info reg
.
rbp   0x4141414141414141    0x4141414141414141   <- overflow data
.
rip   0x00005555555551ad    0x00005555555551ad

```
