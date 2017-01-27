#!/bin/bash
#set -x
for TEST in `seq 30`; do
  echo ${TEST}
  screen -d -m -S screen_ws ssh icn@10.10.0.2 '~/ICNSDN/tsdump.sh >> 8000.log'
  sleep 5 # give tshark a chance to start
  sudo tcpreplay -i eth1 --pps=8000 80kpps.pcapng &
  wait
  ssh icn@10.10.0.2 'kill -15 `pidof tshark`'
  sleep 5
done
echo Done!
