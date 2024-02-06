#!/bin/bash

if [ $(id -u) -ne 0 ]; then
	echo "Must be run as root. Try \`sudo change_wifi_password.sh\`"
	exit 1
fi


while true; do
	read -s -p "Enter the new WiFi Hotspot password: " first_pass
	echo

	if [[ ${#first_pass} -lt 8 ]]; then
		echo "The entered password is too short! At least 8 characters are required."
		echo "Please try again, or hit Ctrl+C to cancel."
		continue
	fi

	read -s -p "Confirm: " second_pass
	echo
	[ "$first_pass" = "$second_pass" ] && break
	echo "The passwords did not match."
	echo "Please try again, or hit Ctrl+C to cancel."
done

nmcli con modify pb-hotspot wifi-sec.psk "${first_pass}" && echo "Success!"
