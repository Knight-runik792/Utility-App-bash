#!/bin/bash
# Define your function here
Test() {
  zenity --info --title "Namaste" --width 50 --height 7 --text "Welcome to St. Xavier\'s College (Autonomous), Mumbai"
  CollegeMenu
}

CollegeMenu() {
  choice=$(zenity --list \
  --title "Choose an Option:" \
  --column "ID" --column="Things you can do" \
  1 "Time Table" \
  2 "College Website" \
  3 "Exams" \
  4 "My Tasks")

  if [ $choice -eq 1 ]
  then
        #zenity --info --title "Inside Usermenu()" --width 50 --height 7 --text "You Have selcted Option 1 = Time Table"
        TimeTable
  elif [ $choice -eq 2 ]
  then
       #zenity --info --title "Inside Usermenu()" --width 50 --height 7 --text "You Have Selected Option 2 = College Website"
       CollegeWebsite
  elif [ $choice -eq 3 ]
  then
       #zenity --info --title "Inside Usermenu()" --width 50 --height 7 --text "You Have Selected Option 3 = Exams"
       UserPersonalDetails
       #CollegeExams
  elif [ $choice -eq 4 ]
  then
       #zenity --info --title "Inside Usermenu()" --width 50 --height 7 --text "You Have Selected Option 4 = My Tasks"
       MyTasks
  else
       ./mos.bash
       #zenity --error --text "Thank You for choosing us"
  fi
}


TimeTable() {
  zenity --list \
  --title "Time Table - SEM 4 - SY" \
  --column "Day/Time" \
  --column="8:00 AM TO 8:50 AM" \
  --column="8:50 AM TO 9:40 AM" \
  --column="9:40 AM TO 10:30 AM" \
  --column="10:30 AM TO 11:20 AM" \
  --column="11:20 AM TO 12:10 PM" \
  --column="12:10 PM TO 13:00 PM" \
  --column="13:00 PM TO 13:50 PM" \
  --column="13:50 PM TO 14:40 PM" \
  --column="14:40 PM TO 15:30 PM" \
  "Monday" "MOS" "MOS" "" "MOS" "" "CFC" "STOR" "SE" "" \
  "Tuesday" "STOR" "STOR" "" "" "DS" "" "MOAD" "SE" "" \
  "Wednesday" "MOS and DS" "MOS and DS" "" "MOAD" "STOR" "CFC" "DS" "" "SE" \
  "Thursday" "CFC" "DS" "DS" "DS" "MOS" "" "DS" "" "" \
  "Friday" "MOAD" "MOAD" "" "" "SE" "" "STOR" "MOS" "" \
  "Saturday" "STOR" "MOS" "" "MOAD" "MOAD" "" "" "" ""
CollegeMenu
}


CollegeWebsite() {
# show web page in a dialog with a next step action
#

zenity --info --title="Information" --text="Let us open a website"
theurl=$(zenity --entry --title="Enter the name for your Folder" --text="Enter here:")
echo theurl

zenity --text-info --title="Background Reading" --html --url=$theurl --checkbox="I read it...and I'm good to go"
rc=$?
echo $rc
case $rc in
    0)
        echo "Start some next step"
    # next step
    ;;
    1)
        echo "Stop installation!"
    ;;
   -1)
        echo "An unexpected error has occurred."
    ;;
esac
CollegeMenu
}




CollegeExams() {
  total=0
  t=1
  f=0
  #create a file for user to store value of the answer
  fname=$(zenity --entry --title="Enter the name for your File" --text="Enter here:")
  touch $fname
  zenity --info --title="Information" --text="We have successfully created a File = $fname"
  zenity --info --text="$(ls)"

  #Question 1
  choice=$( zenity --list --text "Question 1 - Who is the Professor of MOS" --radiolist --column "" --column "Item" FALSE Sundar FALSE Aaron FALSE Satya FALSE Naman)
  echo "Question 1 = $choice" >> $fname
  if [ "$choice" == "Aaron" ]
  then
      echo "Point = $t" >> $fname
      echo "" >> $fname
      total=`expr $total + $t`
  else
      echo "Point = $f" >> $fname
      echo "" >> $fname
      total=`expr $total + $f`
  fi


  #Question 2
  choice=$( zenity --list --text "Question 2 - Who is the Professor of STOR" --radiolist --column "" --column "Item" FALSE Sundar FALSE Roy FALSE Satya FALSE Naman)
  echo "Question 2 = $choice" >> $fname
  if [ "$choice" == "Roy" ]
  then
      echo "Point = $t" >> $fname
      echo "" >> $fname
      total=`expr $total + $t`
  else
      echo "Point = $f" >> $fname
      echo "" >> $fname
      total=`expr $total + $f`
  fi


  #Question 3
  choice=$( zenity --list --text "Question 3 - Who is the Professor of SE" --radiolist --column "" --column "Item" FALSE Sundar FALSE Lydia FALSE Satya FALSE Naman)
  echo "Question 2 = $choice" >> $fname
  if [ "$choice" == "Lydia" ]
  then
      echo "Point = $t" >> $fname
      echo "" >> $fname
      total=`expr $total + $t`
  else
      echo "Point = $f" >> $fname
      echo "" >> $fname
      total=`expr $total + $f`
  fi


  #Question 4
  choice=$( zenity --list --text "Question 4 - Who is the Professor of MOAD" --radiolist --column "" --column "Item" FALSE Sundar FALSE Lydia FALSE Satya FALSE Naman)
  echo "Question 2 = $choice" >> $fname
  if [ "$choice" == "Lydia" ]
  then
      echo "Point = $t" >> $fname
      echo "" >> $fname
      total=`expr $total + $t`
  else
      echo "Point = $f" >> $fname
      echo "" >> $fname
      total=`expr $total + $f`
  fi


  #Question 5
  choice=$( zenity --list --text "Question 5 - Who is the Professor of DS" --radiolist --column "" --column "Item" FALSE Sundar FALSE Subash FALSE Satya FALSE Naman)
  echo "Question 2 = $choice" >> $fname
  if [ "$choice" == "Subash" ]
  then
      echo "Point = $t" >> $fname
      echo "" >> $fname
      total=`expr $total + $t`
  else
      echo "Point = $f" >> $fname
      echo "" >> $fname
      total=`expr $total + $f`
  fi


  echo "Total Marks = $total/5" >> $fname
  echo "" >> $fname
 # exit 0
CollegeMenu
}




UserPersonalDetails() {
OUTPUT=$(zenity --forms --title="User Personal Information" \
  --text="Enter Personal Details" \
  --separator=", " \
  --add-entry="Name" \
  --add-entry="UID" \
  --add-entry="Roll No" \
  --add-entry="Email ID" \
  --add-entry="Subject Name" \
  --add-entry="Subject Code" >> AddRec.txt)

case $? in
    0)
        echo "User Record Added";;
    1)
        echo "No User added."
        ;;
    -1)
        echo "An unexpected error has occurred."
        ;;
esac

CollegeExams
}

MyTasks(){
  zenity --list --checklist --title "My Tasks" --column "Sr No." --column "List of Tasks to be done" \
  True "MOS Project Submission" \
  False "DS Practicals" \
  True "Zephyrus P AND D Meeting at 7:00" \
  True "MOS - CIA 2 Project Submission" \
  True "MOAD - Application done" \
  False "TY IT - Fees payment is left" \
  True "ABC ID - Generated"
CollegeMenu
}


# Invoke your function
Test
