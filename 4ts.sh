#!/bin/bash
tshark -i eth${1} -n -q -z 'io,stat,0,FRAMES()udp.port==56363'

