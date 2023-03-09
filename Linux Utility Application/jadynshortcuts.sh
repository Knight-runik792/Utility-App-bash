#!/bin/bash

demo(){
  zenity --info --title"Hey"  --msgbox --height 7 --width 50 --text"Download Application"
  main
}


main(){
choice=$(zenity --list \
  --title "Download Utility Apps" \
  --column "ID" --column="Application Name" \
  1 "Vscode" \
  2 "Eclipse" \
  3 "Android Studio" \
  4 "WPS Office" \
  5 "Spotify"\
  6 "Disk Cleanup"\
  7 "Wekan"\
  8 "Pomodoro Timer"\
  )



 if [ $choice -eq 1 ]
  then
        VsDown
  elif [ $choice -eq 2 ]
  then
       EclipseDown
 elif [ $choice -eq 3 ]
then 
       AndroidStudioDown
   elif [ $choice -eq 4 ]
  then 
      WPSOfficeDown
  elif [ $choice -eq 5 ]
  then   
  	SpotifyDown  
  elif [ $choice -eq 6 ]
  then   
  	DiskCleaner	
  elif [ $choice -eq 7 ]
  then   
  	Wekan	
  elif [ $choice -eq 8 ]
  then   
  	Productivity
  else
  ./mos.bash
   fi    
   }
   
VsDown(){
if zenity --question \
 --text="Do you want to install VsCode?" ;then
sudo snap install --classic code
else
main
fi
}

EclipseDown(){
if zenity --question \
 --text="Do you want to install Eclipse IDE?";then
snap refresh
snap install eclipse
else
main
fi
}

AndroidStudioDown(){
if zenity --question \
 --text="Do you want to install Android Studio?";then
snap install android-studio --classic
else
main
fi
}

WPSOfficeDown(){
if zenity --question \
 --text="Do you want to install WPS Office?";then
snap apt update
sudo snap install wps-office
else
main
fi
}

SpotifyDown(){
if zenity --question \
 --text="Do you want to install Spotify?";then
sudo snap install spotify
else
main
fi
}

DiskCleaner(){
if zenity --question \
 --text="Do you want to install Disk Cleaner?" ;then
snap install easy-disk-cleaner --devmode
else
main
fi
}

Wekan(){
if zenity --question \
 --text="Do you want to install Wekan?";then
sudo snap install wekan
else
main
fi
}
Productivity(){
if zenity --question \
 --text="Do you want to install Pomodoro Timer?";then
sudo snap install pomotroid
else
main
fi
}





# Invoke your function
demo
