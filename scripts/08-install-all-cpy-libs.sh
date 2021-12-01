set -x
set -e

export LC_ALL=C

source /common.sh
install_cleanup_trap


python files/install_all_cpy_libraries_parallel.py