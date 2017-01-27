#!/bin/bash

#seq ${1} | parallel -n0 sudo nice -n -10 ndnping -i 1 -c 10000 /tno/ping > /home/icn/ICNSDN/log.txt 2>&1

#seq ${1} | parallel -n0 sudo nice -n -10 ndnping -i 50 -c 200 /tno/ping > /dev/null 2>&1

#seq ${1} | parallel -n0 sudo nice -n -10 ndnping -i 1 -c 10000 /tno/ping > /dev/null 2>&1

#parallel "sleep 0.{} && sudo nice -n -10 ndnping -i 1 -c 10000 /tno/ping > /dev/null 2>&1" ::: `seq ${1}`

parallel "sleep {} && sudo nice -n -10 ndnping -i 1 -c 10000 /tno/ping > /dev/null 2>&1" ::: `seq 0 0.25 ${1}`
