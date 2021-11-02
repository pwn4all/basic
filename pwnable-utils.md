# &#35; install tools for pwnable

#### &#42; glibcs : <https://ftp.gnu.org/gnu/glibc/>
#### &#42; libc-database : <https://libc.blukat.me/>


#### &#42; python2.7 & pip2
#### link : <https://www.how2shout.com/linux/how-to-install-python-2-7-on-ubuntu-20-04-lts/>
```bash

$ sudo apt-add-repository universe
$ sudo apt update

$ sudo apt install python2-minimal
$ python -V
Python 3.8.10

$ sudo update-alternatives --install /usr/bin/python python /usr/bin/python2 1
$ sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 2

$ sudo update-alternatives --config python
$ python -V
Python 2.7.18


$ sudo apt install curl 
$ curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip2.py
$ sudo python2 get-pip2.py


## want to uninstall python2
$ sudo apt remove python2-minimal

```


#### &#42; checksec
#### link : <https://github.com/slimm609/checksec.sh/>

```bash
$ cd /usr/local/
$ git clone https://github.com/slimm609/checksec.sh
$ cp checksec.sh/checksec /usr/local/bin/

```


#### &#42; rabin2 & radare
#### link : <https://book.rada.re/index.html/>
```bash
$ apt-get install radare2

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

#### &#42; gef
#### multi platform
```bash
$ sudo wget -O /usr/local/gdbinit-gef.py -q http://gef.blah.cat/py
$ echo source /usr/local/gdbinit-gef.py >> ~/.gdbinit


gef➤  pattern create 300
[+] Generating a pattern of 300 bytes (n=4)
.
.
gef➤  pattern search laaamaaa
[+] Searching for 'laaamaaa'
[+] Found at offset 44 (big-endian search)
gef➤  pattern search kaaalaaa
[+] Searching for 'kaaalaaa'
[+] Found at offset 40 (big-endian search)
gef➤
```


#### &#42; peda & peda-heap
#### x86/x64
```bash
$ sudo git clone https://github.com/zachriggle/peda.git /usr/local/peda
$ echo "source /usr/local/peda/peda.py" >> ~/.gdbinit


$ git clone https://github.com/Mipu94/peda-heap /usr/local/peda-heap
$ echo "source /usr/local/peda-heap/peda.py" >> ~/.gdbinit

```

#### arm
```bash
$ sudo git clone https://github.com/alset0326/peda-arm.git /usr/local/peda-arm
$ echo "source /usr/local/peda-arm/peda-arm.py" >> ~/.gdbinit

```

#### mips
```bash
$ sudo git clone https://github.com/mutepigz/peda-mips.git /usr/local/peda-mips
$ echo "source /usr/local/peda-mips/peda-mips.py" >> ~/.gdbinit

```


#### &#42; pwndbg
```bash

$ sudo git clone https://github.com/pwndbg/pwndbg /usr/local/pwndbg
$ cd /usr/local/pwndbg
$ sudo ./setup.sh

```

#### &#42; qemu
#### link : <https://www.tecmint.com/install-kvm-on-ubuntu/>
```bash

$ egrep -c '(vmx|svm)' /proc/cpuinfo

$ sudo apt install cpu-checker
$ sudo kvm-ok

$ sudo apt install -y qemu qemu-kvm qemu-arm qemu-user qemu-user-static libvirt-daemon libvirt-clients bridge-utils virt-manager
  # The qemu package (quick emulator) is an application that allows you to perform hardware virtualization.
  # The qemu-kvm package is the main KVM package.
  # The libvritd-daemon is the virtualization daemon.
  # The bridge-utils package helps you create a bridge connection to allow other users to access a virtual machine other than the host system.
  # The virt-manager is an application for managing virtual machines through a graphical user interface.

$ sudo service libvirtd status
  # if not running
  $ sudo systemctl enable --now libvirtd

$ sudo apt install gcc-aarch64-linux-gnu binutils-aarch64-linux-gnu binutils-aarch64-linux-gnu-dbg build-essential


## muti gcc
$ sudo apt install gcc-arm-linux-gnueabihf binutils-arm-linux-gnueabihf binutils-arm-linux-gnueabihf-dbg

$ cat hello.c
void main(void) {
  printf("Hello world\n");
}

$ arm-linux-gnueabi-gcc hello.c -o hello-eabi
$ arm-linux-gnueabihf-gcc hello.c -o hello-eabihf

$ qemu-arm -L /usr/arm-linux-gnueabi ./hello-eabi
Hello world
$ qemu-arm -L /usr/arm-linux-gnueabihf/ ./hello-hf
Hello world

```


