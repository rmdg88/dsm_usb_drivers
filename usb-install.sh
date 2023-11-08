#!/bin/bash

# https://github.com/robertklep/dsm7-usb-serial-drivers/tree/main

modprobe usbserial
modprobe ftdi_sio
modprobe cdc-acm

cd /lib/modules/

wget -O ch341.ko https://github.com/rmdg88/dsm_usb_drivers/raw/main/ch341.ko
insmod /lib/modules/ch341.ko
wget -O cp210x.ko https://github.com/rmdg88/dsm_usb_drivers/raw/main/cp210x.ko
insmod /lib/modules/cp210x.ko
wget -O pl2303.ko https://github.com/rmdg88/dsm_usb_drivers/raw/main/pl2303.ko
insmod /lib/modules/pl2303.ko
wget -O ti_usb_3410_5052.ko https://github.com/rmdg88/dsm_usb_drivers/raw/main/ti_usb_3410_5052.ko
insmod /lib/modules/ti_usb_3410_5052.ko
wget -O rndis_host.ko https://github.com/rmdg88/dsm_usb_drivers/raw/main/rndis_host.ko

# Configure an autoload script

cd  /usr/local/etc/rc.d/
wget -O start-usb-drivers.sh https://github.com/rmdg88/dsm_usb_drivers/raw/main/start-usb-drivers.sh
chmod +x start-usb-drivers.sh

# Make sure your devices are recongnized

/usr/local/etc/rc.d/start-usb-drivers.sh start
