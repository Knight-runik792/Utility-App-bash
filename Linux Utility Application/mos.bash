	#!/bin/bash

# Define your function here
Test() {
  zenity --info --title "Namaste" --width 50 --height 7 --text "Welcome to our Linux Utility Application'"
  UserMenu
}

UserMenu() {
choice=$(zenity --list \
  --title "Choose an Option:" \
  --column "ID" --column="Application Functions" \
  1 "File Permissions" \
  2 "My College" \
  3 "Install LAMP" \
  4 "Software Dowloads" \
  5 "CPU Idle Time" \
  6 "Weather Forecast")

  if [ $choice -eq 1 ]
  then
      ./file_permissions.sh
  elif [ $choice -eq 2 ]
  then
      ./MyCollege.sh
  elif [ $choice -eq 3 ]
  then
      ./lamp_installer3.sh
  elif [ $choice -eq 4 ]
  then
      ./jadynshortcuts.sh
  elif [ $choice -eq 5 ]
  then
      ./cpu.sh
  elif [ $choice -eq 6 ]
  then
      ./weather_forecast.sh
  else
       zenity --error --text "Thank You for choosing us"
  fi
}

# Invoke your function
Test


