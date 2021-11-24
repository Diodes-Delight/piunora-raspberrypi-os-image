set -x
set -e

export LC_ALL=C

source /common.sh
install_cleanup_trap


raspi-config nonint do_camera 0
cp files/dt-blob-cam1.bin /boot/dt-blob.bin
