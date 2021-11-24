set -x
set -e

export LC_ALL=C

source /common.sh
install_cleanup_trap

apt-get update

apt-get -y upgrade

apt-get -y install python3-pip

apt-get install -y python3 git python3-pip

#make python3 default
# update-alternatives --install /usr/bin/python python $(which python2) 1
# update-alternatives --install /usr/bin/python python $(which python3) 2
# update-alternatives --skip-auto --config python

pip3 install --upgrade setuptools
pip3 install adafruit-python-shell
pip3 install pip-tools

#install blinka
apt-get install -y i2c-tools
pip3 install --upgrade RPi.GPIO
pip3 install --upgrade adafruit-blinka

#install cpy libs and neopixel support
pip3 install adafruit-circuitpython-mcp3xxx
pip3 install rpi_ws281x adafruit-circuitpython-neopixel
pip3 install adafruit-circuitpython-simpleio