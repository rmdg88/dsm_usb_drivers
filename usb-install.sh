#!/bin/bash

# https://web.archive.org/web/20211027141018/http://www.jadahl.com/iperf-arp-scan/DSM_7.0/geminilake/

modprobe usbserial
modprobe ftdi_sio
modprobe cdc-acm

cd /lib/modules/

wget https://github.com/rmdg88/dsm_usb_drivers/raw/main/ch341.ko
insmod /lib/modules/ch341.ko
wget https://github.com/rmdg88/dsm_usb_drivers/raw/main/cp210x.ko
insmod /lib/modules/cp210x.ko
wget https://github.com/rmdg88/dsm_usb_drivers/raw/main/pl2303.ko
insmod /lib/modules/pl2303.ko
wget https://github.com/rmdg88/dsm_usb_drivers/raw/main/ti_usb_3410_5052.ko
insmod /lib/modules/ti_usb_3410_5052.ko

# Configure an autoload script

cd  /usr/local/etc/rc.d/
wget https://github.com/rmdg88/dsm_usb_drivers/raw/main/usb-serial-drivers.sh
chmod +x usb-serial-drivers.sh

# Make sure your devices are recongnized

/usr/local/etc/rc.d/usb-serial-drivers.sh start
