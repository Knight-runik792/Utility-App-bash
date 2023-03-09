#!/bin/bash

# Define your function here
Test() {
  #dialog --title 'Namaste' --msgbox 'Here We Will Work With File Operations' 7 50
  zenity --info --title "Namaste" --width 50 --height 7 --text "Here We Will Work With File permission"
  UserMenu
}

######################## UserMenu() ################## STARTS #####################
UserMenu() {
  choice=$(zenity --list \
  --title "Choose an Option:" \
  --column "ID" --column="Operation Name" \
  1 "View File/Folder Stats" \
  2 "View File/Folder Contents" \
  3 "Open Zenity Error Box" \
  4 "Create a Folder" \
  5 "Delete A Folder" \
  6 "Change the Ownership of a Folder" \
  7 "Create a File" \
  8 "Delete a File" \
  9 "Change the Ownership of a File" \
  10 "FILE PERMISSIONS" \
  11 "Search & List only .txt files" \
  12 "Find out the number of lines in a file" \
  13 "Find out the number of words in a file" \
  14 "Count the number of bytes in a file" \
  15 "Count number of characters in a file" \
  16 "Count & List the Number of Files & Folder present in the current directory" \
  17 "Create a Copy of a File" \
  18 "Move a File to another location")
 
  if [ $choice -eq 1 ]
  then
        #zenity --info --title "Inside Usermenu()" --width 50 --height 7 --text "You Have selcted Option 1 = View File/Folder Stats"
        ViewFileStats
  elif [ $choice -eq 2 ]
  then
       #zenity --info --title "Inside Usermenu()" --width 50 --height 7 --text "You Have Selected Option 2 = View File/Folder Contents"
       ViewFileContents
 elif [ $choice -eq 3 ]
  then
       #zenity --info --title "Inside Usermenu()" --width 50 --height 7 --text "You Have Selected Option 3 = Open Zenity Error Box"
       OpenZenityError
  elif [ $choice -eq 4 ]
  then
       #zenity --info --title "Inside Usermenu()" --width 50 --height 7 --text "You Have Selected Option 4 = Create a Folder"
       MakeFolder
  elif [ $choice -eq 5 ]
  then
       #zenity --info --title "Inside Usermenu()" --width 50 --height 7 --text "You Have Selected Option 5 = Delete a Folder"
       DeleteFolder
  elif [ $choice -eq 6 ]
  then
       #zenity --info --title "Inside Usermenu()" --width 50 --height 7 --text "You Have Selected Option 6 = Change the Ownership of a Folder"
       ChangeOwnerFolder
  elif [ $choice -eq 7 ]
  then
       #zenity --info --title "Inside Usermenu()" --width 50 --height 7 --text "You Have Selected Option 7 = Create a File"
       MakeFile
  elif [ $choice -eq 8 ]
  then
       #zenity --info --title "Inside Usermenu()" --width 50 --height 7 --text "You Have Selected Option 8 = Delete a File"
       DeleteFile
  elif [ $choice -eq 9 ]
  then
       #zenity --info --title "Inside Usermenu()" --width 50 --height 7 --text "You Have Selected Option 9 = Change the Ownership of a File"
       ChangeOwnerFile
  elif [ $choice -eq 10 ]
  then
       #zenity --info --title "Inside Usermenu()" --width 50 --height 7 --text "You Have Selected Option 10 = FILE PERMISSIONS"
       FilePermissions
  elif [ $choice -eq 11 ]
  then
       #zenity --info --title "Inside Usermenu()" --width 50 --height 7 --text "You Have Selected Option 11 = Search & List only .txt files"
       SearchListTXT
  elif [ $choice -eq 12 ]
  then
       #zenity --info --title "Inside Usermenu()" --width 50 --height 7 --text "You Have Selected Option 12 = Find out the number of lines in a file"
       NoOfLinesInFile
  elif [ $choice -eq 13 ]
  then
       #zenity --info --title "Inside Usermenu()" --width 50 --height 7 --text "You Have Selected Option 13 = Find out the number of words in a file"
       NoOfWordsInFile
  elif [ $choice -eq 14 ]
  then
       #zenity --info --title "Inside Usermenu()" --width 50 --height 7 --text "You Have Selected Option 14 = Count number of bytes in a file"
       CountBytesInFile
  elif [ $choice -eq 15 ]
  then
       #zenity --info --title "Inside Usermenu()" --width 50 --height 7 --text "You Have Selected Option 15 = Count number of characters in a file"
       CountNumberOfCharacters
  elif [ $choice -eq 16 ]
  then
       #zenity --info --title "Inside Usermenu()" --width 50 --height 7 --text "You Have Selected Option 16 = Count & List the Number of Files & Folder present in the current directory"
       CountAndListNumberOfItemsInADirectory
  elif [ $choice -eq 17 ]
  then
       #zenity --info --title "Inside Usermenu()" --width 50 --height 7 --text "You Have Selected Option 16 = Create a Copy of a File"
       CopyAFile
  elif [ $choice -eq 18 ]
  then
       #zenity --info --title "Inside Usermenu()" --width 50 --height 7 --text "You Have Selected Option 16 = Move a File to another location"
       MoveAFile
  else
       #zenity --error --text "Thank You for choosing us"
       ./mos.bash
  fi
}
####################### UserMenu() ################## ENDS #####################












####################### ViewFileStats() ################## STARTS #####################
ViewFileStats() {
  fname=$(zenity --file-selection --title="Select File to view its STATS")
  zenity --info --title="Information" --text="You have selected this file = $fname"
  zenity --info --text="$(stat $fname)"
  #stat $fname | dialog --programbox 30 70
  UserMenu
}
####################### ViewFileStats() ################## ENDS#####################



####################### ViewFileContents() ################## STARTS #####################
ViewFileContents() {
  fname=$(zenity --file-selection --title="Select File to view its Content")
  zenity --info --title="Information" --text="You have selected this file = $fname"
  zenity --text-info --title="Test" --filename=$fname
  UserMenu
}
####################### ViewFileContents() ################## ENDS #####################


####################### OpenZenityError() ################## STARTS #####################
OpenZenityError() {
  zenity --error
  UserMenu
}
####################### OpenZenityError() ################## ENDS #####################


####################### MakeFolder() ################## STARTS #####################
MakeFolder() {
  fname=$(zenity --entry --title="Enter the name for your Folder" --text="Enter here:")
  zenity --info --title="Information" --text="You have entered this name for your folder = $fname"
  mkdir $fname
  zenity --info --title="Information" --text="We have successfully created a Folder = $fname"
  zenity --info --text="$(ls)"
  UserMenu
}
####################### MakeFolder() ################## ENDS #####################


####################### DeleteFolder() ################## STARTS #####################
DeleteFolder() {
  fname=$(zenity --file-selection --directory --title="Select Folder to Delete it")
  zenity --info --title="Information" --text="You have entered this name for your folder = $fname"
  rmdir $fname
  zenity --info --title="Information" --text="We have successfully removed a Folder = $fname"
  zenity --info --text="$(ls)"
  UserMenu
}
####################### DeleteFolder() ################## ENDS #####################


####################### ChangeOwnerFolder() ################## STARTS #####################
ChangeOwnerFolder() {
  fname=$(zenity --file-selection --directory --title="Select Folder to Change its Ownership")
  owner=$(zenity --entry --title="Enter the name of the NEW OWNER" --text="Enter here:")
  #zenity --info --title="Information" --text="You have entered this name for your folder = $fname"
  chown $owner $fname
  zenity --info --title="Information" --text="We have successfully updated the Ownership of this Folder = $fname"
  zenity --info --text="$(stat $fname)"
  UserMenu
}
####################### ChangeOwnerFolder() ################## ENDS #####################


####################### MakeFile() ################## STARTS #####################
MakeFile() {
  fname=$(zenity --entry --title="Enter the name for your File" --text="Enter here:")
  zenity --info --title="Information" --text="You have entered this name for your file = $fname"
  touch $fname
  zenity --info --title="Information" --text="We have successfully created a File = $fname"
  zenity --info --text="$(ls)"
  UserMenu
}
####################### MakeFile() ################## ENDS #####################


####################### DeleteFile() ################## STARTS #####################
DeleteFile() {
  fname=$(zenity --file-selection --title="Select File to Delete it")
  #fname=$(zenity --entry --title="Enter the name for your File" --text="Enter here:")
  zenity --info --title="Information" --text="You have selected this file = $fname"
  rm $fname
  zenity --info --title="Information" --text="We have successfully removed a File = $fname"
  zenity --info --text="$(ls)"
  UserMenu
}
####################### DeleteFile() ################## ENDS #####################


####################### ChangeOwnerFile() ################## STARTS #####################
ChangeOwnerFile() {
  fname=$(zenity --file-selection --title="Select File to Change its Ownership")
  owner=$(zenity --entry --title="Enter the name of the NEW OWNER" --text="Enter here:")
  #zenity --info --title="Information" --text="You have entered this name for your file = $fname"
  chown $owner $fname
  zenity --info --title="Information" --text="We have successfully updated the Ownership of this File = $fname"
  zenity --info --text="$(stat $fname)"
  UserMenu
}
####################### ChangeOwnerFile() ################## ENDS #####################


####################### SearchListTXT() ################## STARTS #####################
SearchListTXT() {
  fname=$(zenity --entry --title="Enter the name for your New File to be searched" --text="Enter here:")
  zenity --info --text=$("find * -name $fname")
  #zenity --info --text=$("find . -name $fname")
  #stat $fname | dialog --programbox 30 70
  UserMenu
}
####################### SearchListTXT() ################## ENDS#####################


####################### NoOfLinesInFile() ################## STARTS #####################
NoOfLinesInFile() {
  fname=$(zenity --file-selection --title="Select File to Know the Number of Lines in it")
  zenity --info --text="$(wc -l $fname)"
  UserMenu
}
####################### NoOfLinesInFile() ################## ENDS #####################


####################### NoOfWordsInFile() ################## STARTS #####################
NoOfWordsInFile() {
  fname=$(zenity --file-selection --title="Select File to Know the Number of Words in it")
  zenity --info --text="$(wc -w $fname)"
  UserMenu
}
####################### NoOfWordsInFile() ################## ENDS #####################


####################### CountBytesInFile() ################## STARTS #####################
CountBytesInFile() {
  fname=$(zenity --file-selection --title="Select File to Count number of bytes in a file in it")
  zenity --info --text="$(wc -c $fname)"
  UserMenu
}
####################### CountBytesInFile() ################## ENDS #####################


####################### CountNumberOfCharacters() ################## STARTS #####################
CountNumberOfCharacters() {
  fname=$(zenity --file-selection --title="Select File to Count number of characters in a file")
  zenity --info --text="$(wc -m $fname)"
  UserMenu
}
####################### CountNumberOfCharacters() ################## ENDS #####################


####################### CountAndListNumberOfItemsInADirectory() ################## STARTS #####################
CountAndListNumberOfItemsInADirectory() {
  zenity --info --text="$(ls gfg)"
  zenity --info --text="$(ls gfg | wc -l)"
  UserMenu
}
####################### CountAndListNumberOfItemsInADirectory() ################## ENDS #####################


####################### CopyAFile() ################## STARTS #####################
CopyAFile() {
  fname=$(zenity --file-selection --title="Select a file to create a copy of it")
  newfname=$(zenity --entry --title="Enter the name for your New File" --text="Enter here:")
  cp $fname $newfname
  zenity --info --title="Information" --text="We have successfully made a copy of this file = $fname with a new name = $newfname"
  zenity --info --text="$(ls)"
  UserMenu
}
####################### CopyAFile() ################## ENDS #####################


####################### MoveAFile() ################## STARTS #####################
MoveAFile() {
  fname=$(zenity --file-selection --directory --title="Select a Directory in which you want to move your file")
  newfname=$(zenity --file-selection --title="Select a file which you want to move to this directory = $fname")
  mv $newfname $fname
  zenity --info --title="Information" --text="We have successfully moved your $newfname to $fname"
  zenity --info --text="$(ls)"
  UserMenu
}
####################### MoveAFile() ################## ENDS #####################















####################### FilePermissions() ################## STARTS #############################################################################################################
FilePermissions() {
  zenity --info --title="Namaste" --text="Welcome To FILE PERMISSIONS"
  choice=$(zenity --list \
  --title "In Which Category you want to execute File Permissions?:" \
  --column "ID" --column="Category Name" \
  1 "User" \
  2 "Group" \
  3 "Others")

  if [ $choice -eq 1 ]
  then
      zenity --info --title="FILE PERMISSION -- ONLY USER" --text="You Have selcted Option 1 = USER"
      UserFilePermission
  elif [ $choice -eq 2 ]
  then
      zenity --info --title="FILE PERMISSION -- ONLY GROUP" --text="You Have selcted Option 2 = GROUP"
      GroupFilePermission
  elif [ $choice -eq 3 ]
  then
      zenity --info --title="FILE PERMISSION -- ONLY OTHERS" --text="You Have selcted Option 3 = OTHERS"
      OthersFilePermission
  else
      UserMenu
  fi
}
####################### FilePermissions() ################## ENDS ###################################################################################################################


#--------------------------------------------- UserFilePermissions() -------------------------------------------STARTS------------------------------------------------------------------
UserFilePermission() {
  fname=$(zenity --file-selection --title="Select File/Folder you want to perform your file permissions")
  zenity --info --title="FILE PERMISSION -- ONLY USER" --text="The System will perform User Permissions on this File/Folder = $fname"
  choice=$(zenity --list \
  --title "Select the User Permission you want to give to this File/Folder = $fname" \
  --column "ID" --column="Name of the Permission" \
  1 "No Permission" \
  2 "Read Only" \
  3 "Write Only" \
  4 "Execute Only" \
  5 "Read & Write Only" \
  6 "Read & Execute Only" \
  7 "Write & Execute Only" \
  8 "Read, Write & Execute Only")

  if [ $choice -eq 1 ]
  then
      chmod 000 $fname
  elif [ $choice -eq 2 ]
  then
      chmod 400 $fname
  elif [ $choice -eq 3 ]
  then
      chmod 200 $fname
  elif [ $choice -eq 4 ]
  then
      chmod 100 $fname
  elif [ $choice -eq 5 ]
  then
      chmod 600 $fname
  elif [ $choice -eq 6 ]
  then
      chmod 500 $fname
  elif [ $choice -eq 7 ]
  then
      chmod 300 $fname
  elif [ $choice -eq 8 ]
  then
      chmod 700 $fname
  else
      stat $fname | dialog --stdout --programbox 10 90
  fi
zenity --info --text="$(stat $fname)"
FilePermissions
}
#--------------------------------------------- UserFilePermissions() ------------------------------------------- ENDS ------------------------------------------------------------------






#--------------------------------------------- GroupFilePermissions() -------------------------------------------STARTS------------------------------------------------------------------
GroupFilePermission() {
  fname=$(zenity --file-selection --title="Select File/Folder you want to perform your file permissions")
  zenity --info --title="FILE PERMISSION -- ONLY GROUP" --text="The System will perform User Permissions on this File/Folder = $fname"
  choice=$(zenity --list \
  --title "Select the GROUP Permission you want to give to this File/Folder = $fname" \
  --column "ID" --column="Name of the Permission" \
  1 "No Permission" \
  2 "Read Only" \
  3 "Write Only" \
  4 "Execute Only" \
  5 "Read & Write Only" \
  6 "Read & Execute Only" \
  7 "Write & Execute Only" \
  8 "Read, Write & Execute Only")

  if [ $choice -eq 1 ]
  then
      chmod 000 $fname
  elif [ $choice -eq 2 ]
  then
      chmod 040 $fname
  elif [ $choice -eq 3 ]
  then
      chmod 020 $fname
  elif [ $choice -eq 4 ]
  then
      chmod 010 $fname
  elif [ $choice -eq 5 ]
  then
      chmod 060 $fname
  elif [ $choice -eq 6 ]
  then
      chmod 050 $fname
  elif [ $choice -eq 7 ]
  then
      chmod 030 $fname
  elif [ $choice -eq 8 ]
  then
      chmod 070 $fname
  else
      stat $fname | dialog --stdout --programbox 10 90
  fi
zenity --info --text="$(stat $fname)"
FilePermissions
}
#--------------------------------------------- GroupFilePermissions() ------------------------------------------- ENDS ------------------------------------------------------------------



#--------------------------------------------- OthersFilePermissions() -------------------------------------------STARTS------------------------------------------------------------------
OthersFilePermission() {
  fname=$(zenity --file-selection --title="Select File/Folder you want to perform your file permissions")
  zenity --info --title="FILE PERMISSION -- ONLY OTHERS" --text="The System will perform OTHERS Permissions on this File/Folder = $fname"
  choice=$(zenity --list \
  --title "Select the OTHERS Permission you want to give to this File/Folder = $fname" \
  --column "ID" --column="Name of the Permission" \
  1 "No Permission" \
  2 "Read Only" \
  3 "Write Only" \
  4 "Execute Only" \
  5 "Read & Write Only" \
  6 "Read & Execute Only" \
  7 "Write & Execute Only" \
  8 "Read, Write & Execute Only")

  if [ $choice -eq 1 ]
  then
      chmod 000 $fname
  elif [ $choice -eq 2 ]
  then
      chmod 004 $fname
  elif [ $choice -eq 3 ]
  then
      chmod 002 $fname
  elif [ $choice -eq 4 ]
  then
      chmod 001 $fname
  elif [ $choice -eq 5 ]
  then
      chmod 006 $fname
  elif [ $choice -eq 6 ]
  then
      chmod 005 $fname
  elif [ $choice -eq 7 ]
  then
      chmod 003 $fname
  elif [ $choice -eq 8 ]
  then
      chmod 007 $fname
  else
      stat $fname | dialog --stdout --programbox 10 90
  fi
zenity --info --text="$(stat $fname)"
FilePermissions
}
#--------------------------------------------- OthersFilePermissions() ------------------------------------------- ENDS ------------------------------------------------------------------





# Invoke your function
Test
