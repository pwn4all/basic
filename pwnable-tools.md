# &#35; install tools for pwnable

#### &#42; glibcs : <https://ftp.gnu.org/gnu/glibc/>
#### &#42; libc-database : <https://libc.blukat.me/>

#### &#42; checksec
#### link : <https://github.com/slimm609/checksec.sh/>
```bash
$ cd /usr/local/
$ git clone https://github.com/slimm609/checksec.sh
$ cp checksec.sh/checksec /usr/local/bin/

```

#### &#42; pwntools
#### link : <https://github.com/Gallopsled/pwntools/>
```bash
$ apt-get update
$ apt-get install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential
$ pip install pwntools
$ pip3 install pwntools

```

#### &#42; ROPGadget
```bash

$ pip install ropgadget

```


#### &#42; one_gadget
```bash

$ apt install ruby
$ gem install one_gadget

```


#### &#42; peda & peda-heap
#### x86/x64
```bash
$ git clone https://github.com/zachriggle/peda.git /usr/local/peda
$ echo "source /usr/local/peda/peda.py" >> ~/.gdbinit


$ git clone https://github.com/Mipu94/peda-heap /usr/local/peda-heap
$ echo "source /usr/local/peda-heap/peda.py" >> ~/.gdbinit

```

#### arm
```bash
$ git clone https://github.com/alset0326/peda-arm.git /usr/local/peda-arm
$ echo "source /usr/local/peda-arm/peda-arm.py" >> ~/.gdbinit

```

#### mips
```bash
$ git clone https://github.com/mutepigz/peda-mips.git /usr/local/peda-mips
$ echo "source /usr/local/peda-mips/peda-mips.py" >> ~/.gdbinit

```


#### &#42; pwndbg
```bash

$ git clone https://github.com/pwndbg/pwndbg /usr/local/pwndbg
$ /usr/local/pwndbg
$ ./setup.sh

```

