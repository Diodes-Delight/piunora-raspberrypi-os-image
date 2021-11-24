set -x
set -e

export LC_ALL=C

source /common.sh
install_cleanup_trap

raspi-config nonint disable_raspi_config_at_boot 0
raspi-config nonint do_ssh 0