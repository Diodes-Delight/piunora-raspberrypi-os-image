set -x
set -e

export LC_ALL=C

source /common.sh
install_cleanup_trap

cp files/config.txt /boot/