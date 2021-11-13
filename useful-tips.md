# &#35; useful tips
#### change libc.so
```bash
## 1) save to shell
$ export LD_PRELOAD=./libc.so

## 2) gdb
$ gdb ./binary -q
gef➤ set environment LD_PRELOAD=./libc.so
gef➤  show environment
.
.
LD_PRELOAD=./libc.so


## 3) execute
$ LD_PRELOAD=./libc.so ./binary

## 4) unset/delete
$ unset LD_PRELOAD

```



#### libc-database command
#### link : <https://github.com/niklasb/libc-database/>
```bash
## Install everything
## To install everything on Debian 10, run these commands:
$ sudo apt-get update
$ sudo apt-get install -y \
  binutils file \
  wget \
  rpm2cpio cpio \
  zstd jq

$ cd /usr/local
$ git clone https://github.com/niklasb/libc-database.git

$ cd ./gibc-database
## Download all categories. Can take a while!
$ ./get all

$ ./add /usr/lib/libc-2.21.so

$ ./find printf 260 puts f30
archive-glibc (libc6_2.19-10ubuntu2_i386)

$ ./find __libc_start_main_ret a83
ubuntu-trusty-i386-libc6 (libc6_2.19-0ubuntu6.6_i386)
archive-eglibc (libc6_2.19-0ubuntu6_i386)
ubuntu-utopic-i386-libc6 (libc6_2.19-10ubuntu2.3_i386)
archive-glibc (libc6_2.19-10ubuntu2_i386)
archive-glibc (libc6_2.19-15ubuntu2_i386)


$ ./dump libc6_2.19-0ubuntu6.6_i386
offset___libc_start_main_ret = 0x19a83
offset_system = 0x00040190
offset_dup2 = 0x000db590
offset_recv = 0x000ed2d0
offset_str_bin_sh = 0x160a24

```









