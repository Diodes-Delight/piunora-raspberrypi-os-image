set -x
set -e

export LC_ALL=C

source /common.sh
install_cleanup_trap

# Creates the filesystem that will be mounted to the host computer
mkdir /opt/piunora-usbmount
dd if=/dev/zero of=/opt/piunora-usbmount/usb-storage.bin bs=512 count=524288
mkdosfs /opt/piunora-usbmount/usb-storage.bin
fatlabel /opt/piunora-usbmount/usb-storage.bin "Piunora"
chown -R pi:pi /opt/piunora-usbmount

echo 'options g_multi file=/opt/piunora-usbmount/usb-storage.bin removable=1 stall=0' > /etc/modprobe.d/g_multi.conf

#`dwc2` is the usb driver, that should load already by enabling it in `config.txt` but better go sure
#`g_multi` is the ethernet, storage, serial multi mode.

sed -i -e 's/$/ modules-load=dwc2,g_multi/' /boot/cmdline.txt

#enable TTY service without systemd running
ln -s /lib/systemd/system/getty@.service /etc/systemd/system/getty.target.wants/getty@ttyGS0.service

apt install inotify-tools -y
# For networking on Windows install Microsoft RNDIS USB Adapter via device manager.
# By default no driver is loaded.
# You can then login via `ssh pi@raspberrypi.local`
# To share internet go to Network Connections, go to properties of your internet connection
# and enable sharing in the sharing tab, there choose the RNDIS network interface.
# It may take a bit before the connection will work, maybe some DHCP stuff, not sure what causes the delay.