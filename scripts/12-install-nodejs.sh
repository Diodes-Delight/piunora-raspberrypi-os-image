set -x
set -e

export LC_ALL=C

source /common.sh
install_cleanup_trap


curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
apt-get install nodejs -y
apt-get update
apt-get install yarn -y