#!/bin/bash

zenity --info --text=$(top -n 1 | grep %Cpu | awk '{print $8}') --title="CPU Idle Time"
./mos.bash
