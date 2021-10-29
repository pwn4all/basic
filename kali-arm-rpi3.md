# &#35; kali linux arm on raspberry pi3

#### &#42; download : <https://www.kali.org/get-kali/#kali-arm/>
#### &#42; older version : <http://old.kali.org/kali-images/>

#### &#42; My Version : kali-linux-2021.3-rpi4-nexmon-arm64.img



#### &#42; 1) repository address
#### link : <https://www.kali.org/docs/general-use/kali-linux-sources-list-repositories/>
```bash
$ echo "deb http://http.kali.org/kali kali-rolling main non-free contrib" | sudo tee /etc/apt/sources.list
```

#### &#42; 2) apt update success
#### link : <https://www.kali.org/docs/general-use/metapackages/>
```bash
$ sudo apt update
------------------------------
$ sudo apt list –upgradeable
$ sudo apt upgrade
------------------------------
or
------------------------------
$ sudo apt install -y kali-linux-arm

```


#### &#42; 3) install gdb
```bash
$ sudo apt install gdb

```



#### &#42; etc : apt update error
#### &#42; 1) [PGP] Auth key error
#### link : <https://superuser.com/questions/1644520/apt-get-update-issue-in-kali/>
```bash

$ wget -q -O - https://archive.kali.org/archive-key.asc  | sudo apt-key add –
invalid period ....failed....

$ wget --no-check-certificate https://http.kali.org/kali/pool/main/k/kali-archive-keyring/kali-archive-keyring_2020.2_all.deb
$ sudo dpkg -i kali-archive-keyring_2020.2_all.deb
```

