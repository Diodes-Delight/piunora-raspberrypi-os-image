set -x
set -e

export LC_ALL=C

source /common.sh
install_cleanup_trap

wget https://static.rust-lang.org/rustup/dist/armv7-unknown-linux-gnueabihf/rustup-init
chmod +x rustup-init
sudo -u pi ./rustup-init -y
rm rustup-init