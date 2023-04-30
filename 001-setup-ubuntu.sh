####################################################################################
## install packages
####################################################################################
apt-get update
apt-get install build-essential gcc-multilib g++-multilib -y
apt-get install gdb gdb-multiarch tmux -y
apt-get install vim net-tools netcat git curl locales -y

####################################################################################
## install pwntools
####################################################################################
apt-get install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential -y
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade pwntools


####################################################################################
## install 32bit-libs
####################################################################################
dpkg --add-architecture i386
apt-get update
apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 -y


####################################################################################
## install peda and gef
####################################################################################
git clone https://github.com/longld/peda.git /usr/local/peda
echo "source /usr/local/peda/peda/peda.py" >> ~/.gdbinit

git clone https://github.com/pwndbg/pwndbg /usr/local/pwndbg
cd /usr/local/pwndbg && ./setup.sh
echo 'source /usr/local/pwndbg/gdbinit.py' >> ~/.gdbinit

curl -L https://raw.githubusercontent.com/hugsy/gef/dev/gef.py -o /usr/local/gef/gef.py
echo "source /usr/local/gef/gef.py" >> ~/.gdbinit


####################################################################################
## install ROPgadget
####################################################################################
apt-get install python3-capstone -y
python3 -m pip install ropgadget


####################################################################################
## install one_gadget
####################################################################################
apt-get install ruby -y
gem install one_gadget

