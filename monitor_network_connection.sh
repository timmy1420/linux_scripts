#!/bin/bash

retries=0

re_check_connection () {
    ((retries=retries+1))

    if [ $retries -lt 5 ]; then
        sleep 60;
        check_connection
    else
        echo "Rebooting now..."
        reboot;
    fi
}

check_connection () {
    wget -q --spider http://google.com

    if [ $? -eq 0 ]; then
        echo "Online"
    else
        echo "Offline. Re-applying netplan..."

        recofigure_connection

        re_check_connection
    fi
}

recofigure_connection () {
    # First disable vpn interface
    ip link set tun0 down;

    sleep 2; # Pause

    # Then restart main interface
    ip link set eno1 down; ip link set eno1 up;

    sleep 2; # Pause

    # Apply network configuration
    netplan apply;

    sleep 2; # Pause

    # Bring vpn back up
    ip link set tun0 up;
    systemctl restart openvpn@tbym-client
}

check_connection

# Wait operation for 5 minutes
sleep 300
