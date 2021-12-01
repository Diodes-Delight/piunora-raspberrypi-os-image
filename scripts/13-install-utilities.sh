set -x
set -e

export LC_ALL=C

source /common.sh
install_cleanup_trap


#listed individually for now so its easier to keep track/modify
apt install vim -y
apt install tmux -y
apt install screen -y
apt install yubico-piv-tool -y

wget https://github.com/watchexec/watchexec/releases/download/cli-v1.17.1/watchexec-1.17.1-armv7-unknown-linux-gnueabihf.deb
dpkg -i watchexec-1.17.1-armv7-unknown-linux-gnueabihf.deb
rm watchexec-1.17.1-armv7-unknown-linux-gnueabihf.deb

#OpenOCD 
# apt install git autoconf libtool make pkg-config libusb-1.0-0 libusb-1.0-0-dev jimsh tcl -y
# git clone https://git.code.sf.net/p/openocd/code openocd
# cd openocd
# ./bootstrap
# ./configure --enable-sysfsgpio --enable-bcm2835gpio
# make -j4
# make install
# cd ..
# rm -r openocd