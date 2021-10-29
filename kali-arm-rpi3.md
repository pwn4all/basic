# &#35; kali linux arm on raspberry pi3

#### &#42; download : <https://www.kali.org/get-kali/#kali-arm/>
#### &#42; older version : <http://old.kali.org/kali-images/>

#### &#42; My Version : kali-linux-2018.4-rpi3-nexmon.img
```bash
$ Can't connect wifi on the other kali-linux-versions.
```

#### &#42; apt update error
## &#42; 1) [PGP] Auth key error
## link : <https://superuser.com/questions/1644520/apt-get-update-issue-in-kali/>
```bash

# wget -q -O - https://archive.kali.org/archive-key.asc  | apt-key add –
invalid period ....failed....

# wget --no-check-certificate https://http.kali.org/kali/pool/main/k/kali-archive-keyring/kali-archive-keyring_2020.2_all.deb
# dpkg -i kali-archive-keyring_2020.2_all.deb
```

## &#42; 2) repository address
## link : <https://www.kali.org/docs/general-use/kali-linux-sources-list-repositories/>
```bash
# echo "deb http://http.kali.org/kali kali-rolling main non-free contrib" | sudo tee /etc/apt/sources.list
```

## &#42; 3) apt update success
## link : <https://www.kali.org/docs/general-use/metapackages/>
```bash
# apt update
------------------------------
# apt list –upgradeable
# apt upgrade
------------------------------
or
------------------------------
apt install -y kali-linux-arm
apt upgrade
```


## &#42; 4) install gdb
```bash
# apt install gdb

```

