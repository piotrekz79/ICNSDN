#!/bin/bash
#install wireshark ndn dissector

sudo mkdir /usr/share/ndn-dissect-wireshark
cd /usr/share/ndn-dissect-wireshark

sudo wget https://raw.githubusercontent.com/named-data/ndn-tools/master/tools/dissect-wireshark/ndn.lua
sudo wget https://raw.githubusercontent.com/named-data/ndn-tools/master/tools/dissect-wireshark/wscript
sudo wget https://raw.githubusercontent.com/named-data/ndn-tools/master/tools/dissect-wireshark/README.md

echo "-- dofile(\"/full/path/to/ndn.lua\")" | sudo tee -a /usr/share/wireshark/init.lua
echo "dofile(\"/usr/local/share/ndn-dissect-wireshark/ndn.lua\")" | sudo tee -a /usr/share/wireshark/init.lua
