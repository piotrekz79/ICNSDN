#!/bin/bash

#to prevent sys/cdefs.h: no such file when compiling bpf program
sudo apt-get install g++-multilib



#clang-3.7
./install_llvm.sh

#mind that without -c which means "Only run preprocess, compile, and assemble steps"
# we get errors unknown architecture of input file
cd bin
clang-3.7 -O2 -target bpf -c match_param_icn.c -o match_param_icn.o

cd
mkdir ebpf



### ubpf
cd ebpf
git clone https://github.com/b0rg3rt/ubpf.git
cd ubpf
make -C vm

### softswitch
cd
cd ebpf
git clone https://github.com/b0rg3rt/ofsoftswitch13.git
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo "DO NOT USE procedure described in README.md for installation"
echo "if running ubuntu 14.04 or later"
echo "this is because netbee in version from 2005 is needed"
echo "instead it is better to use new (2.2.1+) mininet and"
echo "use install.sh -3f, then sudo make uninstall ofsoftswitch got from miniet"
echo "and proceed with installation of this one"

### ryu

sudo apt-get install autoconf automake g++ libtool python make
sudo apt-get install libxml2 libxslt-dev python-dev
sudo apt-get install libssl-dev 
sudo apt-get install python-msgpack #0.4 needed ? http://ewen.mcneill.gen.nz/blog/entry/2014-08-31-ryu-on-ubuntu-14-04/
sudo apt-get install python-eventlet python-lxml python-oslo.config
sudo pip install --upgrade gevent pbr webob routes paramiko 
#sudo pip install oslo.config # did not work ? we needed sudo apt-get install python-oslo.config


cd
cd ebpf
git clone https://github.com/b0rg3rt/ryu.git
cd ryu
sudo python ./setup.py install
# Add symbolic link to /usr/bin
sudo ln -s ./bin/ryu-manager /usr/local/bin/ryu-manager





## run!
cd ~/ebpf/ryu/bin
ryu run application_ebpf.py 

#new term

#cd ~/ebpf/ofsoftswitch13 #not needed if we did sudo make install ofsoft
sudo ofprotocol tcp:localhost:6653 tcp:localhost:6633
#new term
sudo ofdatapath -i eth1,eth2 ptcp:6653

##client
#nfd-status to see facenum of eth
#nfdc register /tno 256 

##server
#ndnpingserver ndn:/tno

##client
#ndnping /tno/ping
