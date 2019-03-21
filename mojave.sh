#!/bin/bash
readonly VM_RES="1280x800"
readonly NAME="Mojave"

VBoxManage modifyvm "$NAME" --usbxhci on --firmware efi --chipset ich9 --mouse usbtablet --keyboard usb
VBoxManage setextradata "$NAME" "CustomVideoMode1" "${VM_RES}x32"
VBoxManage setextradata "$NAME" VBoxInternal2/EfiGraphicsResolution "$VM_RES"
VBoxManage modifyvm "$NAME" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
VBoxManage setextradata "$NAME" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"
VBoxManage setextradata "$NAME" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage setextradata "$NAME" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
VBoxManage setextradata "$NAME" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata "$NAME" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
