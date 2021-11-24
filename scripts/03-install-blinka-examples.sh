set -x
set -e

export LC_ALL=C

source /common.sh
install_cleanup_trap

cp -r files/piunora-blinka-examples /home/pi/
chown -R pi:pi /home/pi/piunora-blinka-examples