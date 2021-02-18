#!/bin/bash

# This script makes use of Bluetooth_Headset_Battery_Level GitHub package
# https://github.com/TheWeirdDev/Bluetooth_Headset_Battery_Level

# Text file with bluetooth hardware address
address=$(cat linux_scripts/bluetooth_addr)

# Output command
comm=$(bluetooth-headset-battery-level ${address})

if [[ ${comm::6} != "Couldn" ]]
then
	echo "BT Battery: ${comm//Battery level for ${address} is }"
else
	echo "BT Battery: N/A"
fi
