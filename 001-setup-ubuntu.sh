####################################################################################
## install packages
####################################################################################
sudo apt-get update
sudo apt-get install build-essential gdb gcc-multilib g++-multilib git tmux


####################################################################################
## install pwntools
####################################################################################
sudo apt-get install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential
sudo python3 -m pip install --upgrade pip
sudo python3 -m pip install --upgrade pwntools



####################################################################################
## install 32bit-libs
####################################################################################
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386


####################################################################################
## install peda and gef
####################################################################################
git clone https://github.com/longld/peda.git /usr/local/peda
echo "source /usr/local/peda/peda/peda.py" >> ~/.gdbinit

curl -L https://raw.githubusercontent.com/hugsy/gef/dev/gef.py -o /usr/local/gef/gef.py
echo "source /usr/local/gef/gef.py" >> ~/.gdbinit


####################################################################################
## install ROPgadget
####################################################################################
sudo apt-get install python3-capstone
sudo python3 -m pip install ropgadget


####################################################################################
## install one_gadget
####################################################################################
sudo apt-get install ruby
sudo gem install one_gadget

