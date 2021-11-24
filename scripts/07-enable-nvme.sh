set -x
set -e

export LC_ALL=C

source /common.sh
install_cleanup_trap

echo "nvme" >> /etc/modules-load.d/modules.conf