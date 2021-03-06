#!/bin/bash
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:named-data/ppa
sudo apt-get update 
sudo apt-get install ndn-cxx  -y
sudo apt-get install nfd  -y
sudo apt-get install nlsr  -y
sudo apt-get install ndn-tools  -y
sudo apt-get install git  -y

cd 

sudo apt-get install -y \
	python-pip \
	python-dev \
	python-crypto \
	&& sudo pip install protobuf \
	&& git clone --depth 1 https://github.com/named-data/PyNDN2.git \
	&& cd PyNDN2 \
	&& sudo CFLAGS=-Qunused-arguments python ./setup.py install \
	&& cd .. \
	&& rm -rf PyNDN2/