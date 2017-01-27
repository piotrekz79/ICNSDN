#!/bin/bash
#installs LLVM + Clang + compiler-rt + polly + LLDB on ubuntu 14.04
#as described on http://apt.llvm.org/


echo "deb http://apt.llvm.org/trusty/ llvm-toolchain-trusty main" | sudo tee -a /etc/apt/sources.list.d/llvm.list 

echo "deb-src http://apt.llvm.org/trusty/ llvm-toolchain-trusty main" | sudo tee -a /etc/apt/sources.list.d/llvm.list 

echo "deb http://apt.llvm.org/trusty/ llvm-toolchain-trusty-3.7 main" | sudo tee -a /etc/apt/sources.list.d/llvm.list 
echo "deb-src http://apt.llvm.org/trusty/ llvm-toolchain-trusty-3.7 main" | sudo tee -a /etc/apt/sources.list.d/llvm.list 

sudo apt-get update

#To retrieve the archive signature: 
wget -O - http://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -

#This is really chunky (800MB) but I don't know what is really needed
#(possibly clang-3.7 and llvm-3.7)
sudo apt-get install clang-3.7 clang-3.7-doc libclang-common-3.7-dev libclang-3.7-dev libclang1-3.7 libclang1-3.7-dbg libllvm-3.7-ocaml-dev libllvm3.7 libllvm3.7-dbg lldb-3.7 llvm-3.7 llvm-3.7-dev llvm-3.7-doc llvm-3.7-examples llvm-3.7-runtime clang-modernize-3.7 clang-format-3.7 python-clang-3.7 lldb-3.7-dev 
