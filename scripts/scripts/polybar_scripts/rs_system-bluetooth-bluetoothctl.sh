#!/bin/sh

bluetooth_print() {
	bluetoothctl | while read -r; do
		if [ "$(systemctl is-active "bluetooth.service")" = "active" ]; then
#			if bluetoothctl show | grep -q "Powered: no"; then
#				printf " Off"
#			else
#				printf " On"
#			fi	    


			devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
			counter=0

			for device in $devices_paired; do
				device_info=$(bluetoothctl info "$device")

				if echo "$device_info" | grep -q "Connected: yes"; then

					counter=$((counter + 1))

#					printf "\n %i Connected" "$counter"
				fi
			done
		
			if [ $counter -gt 0 ]; then
				printf " %i Connected" "$counter"
			else
				if bluetoothctl show | grep -q "Powered: no"; then
					printf " Off"
				else
					printf " On"
				fi
			fi
			printf '\n'
		fi
	done
}

bluetooth_toggle() {
	if bluetoothctl show | grep -q "Powered: no"; then
		bluetoothctl power on >> /dev/null
		sleep 1

		devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
		echo "$devices_paired" | while read -r line; do
			bluetoothctl connect "$line" >> /dev/null
		done
	else
		devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
		echo "$devices_paired" | while read -r line; do
			bluetoothctl disconnect "$line" >> /dev/null
		done

		bluetoothctl power off >> /dev/null
	fi
}

case "$1" in
	--toggle)
		bluetooth_toggle
		;;
	*)
		bluetooth_print
		;;
esac
