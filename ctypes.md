# &#35; ctypes of python

#### &#42; gcc manual : <https://docs.python.org/ko/3/library/ctypes.html/>

#### &#42; srand()
```python

libc = CDLL("/lib/x86_64-linux-gnu/libc.so.6")
libc.srand(libc.time(0))
key = libc.rand()

print(key)

```




