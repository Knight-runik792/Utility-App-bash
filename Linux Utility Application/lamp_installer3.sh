#!/bin/bash

# Define the components to install
components="apache2 mysql-server php"

# Display welcome message and confirm installation
if ! zenity --question --text="Welcome to the LAMP installer. This will install Apache, MySQL, and PHP on your system. Do you want to continue?"; then
 ./mos.bash
 exit 0
else
# Loop through each component and install it
for component in $components; do
  # Display progress dialog
  (
    echo "0" ; echo "Installing $component" ; echo "Please wait..."
    sudo apt-get install -y $component 2>&1 | tee -a lamp_installer.log ; 
    echo "100" ; echo "Installation of $component complete." ; echo "You can now start using Apache, MySQL, and PHP."
  ) | zenity --progress --title="LAMP Installer" --auto-close --no-cancel --width=350

  # Display installation logs in terminal
  echo "Installation logs for $component:"
  cat lamp_installer.log
  echo
done

# Display installation complete message
zenity --info --text="LAMP installation complete. You can now start using Apache, MySQL, and PHP." --title="LAMP Installer"

# Display installation logs in terminal
echo "Installation logs:"
cat lamp_installer.log
fi




