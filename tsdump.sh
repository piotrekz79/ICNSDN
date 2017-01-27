#!/bin/bash
tshark -i eth2 -n -q -z 'io,stat,0,FRAMES()udp.port==56363'
# > ${1}.txt &


