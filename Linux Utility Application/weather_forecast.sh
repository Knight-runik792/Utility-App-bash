#!/bin/bash


main(){
	Weather
}
Weather(){
zenity --question --text="Would you like to see the weather forecast "?
sudo snap install curl
zenity --text-info --title="Background Reading" --html --url=http://wttr.in/$1
./mos.bash
}
main

