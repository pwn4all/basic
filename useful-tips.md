# &#35; useful tips
#### change libc.so

```bash
## 1) save to shell
$ export LD_PRELOAD=./libc.so

## 2) gdb
$ gdb ./binary -q
gef➤ set environment LD_PRELOAD=./libc.so


## 3) execute
$ LD_PRELOAD=./libc.so ./binary

## 4) unset/delete
$ unset LD_PRELOAD

```
