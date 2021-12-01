set -x
set -e

export LC_ALL=C

source /common.sh
install_cleanup_trap

wget https://go.dev/dl/go1.17.3.linux-armv6l.tar.gz
tar -C /usr/local -xzf go1.17.3.linux-armv6l.tar.gz
rm go1.17.3.linux-armv6l.tar.gz
printf "\nexport PATH=\$PATH:/usr/local/go/bin" >> /etc/profile
source /etc/profile