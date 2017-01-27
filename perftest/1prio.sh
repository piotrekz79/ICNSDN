#!/bin/bash
sudo renice -n -10 -p `pidof nfd`

