

libc = CDLL("/lib/x86_64-linux-gnu/libc.so.6")
libc.srand(libc.time(0))
key = libc.rand()

print(key)
