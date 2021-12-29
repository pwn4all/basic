

# &#35; hex to string


```python
$ cat hex2str.py
# print end invalid syntax on python2
from __future__ import print_function

nums = [0x79,0x17,0x46,0x55,0x10,0x53,0x5f,0x5d,0x55,0x10,0x58,0x55,0x42,0x55,0x10,0x44,0x5f,0x3a]

print()

for num in nums:
    print( chr(int(hex(num),16)), end='')

print()

```


```bash
$ python hex2str.py
yFUS_]UXUBUD_:

$ python3 a.py /bin/sh
yFUS_]UXUBUD_:

```
