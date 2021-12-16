# &#35; pwn shellcraft command

```bash
## make exec shellcode
$ pwn shellcraft --list | grep amd64.linux.sh


>>> context.clear()
>>> context.os='linux'
>>> context.arch='amd64'
>>> asm(shellcraft.amd64.linux.sh())
b'jhH\xb8/bin///sPH\x89\xe7hri\x01\x01\x814$\x01\x01\x01\x011\xf6Vj\x08^H\x01\xe6VH\x89\xe61\xd2j;X\x0f\x05'
>>> p=run_assembly(shellcraft.amd64.linux.sh())
.
.
>>> p.interactive()
[*] Switching to interactive mode


id
uid=1000(user) gid=1000(user) groups=1000(user),27(sudo)


```
