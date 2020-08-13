#! /usr/bin/env sh

###############################################################################
# testing docker and scripts in docker
###############################################################################

set -e

# testing mksource.sh
mksource -h && \
mksource -n Makefile && \
mksource -n hello_c.h && \
mksource -n hello_c.c && \
mksource -n hello_cc.hh && \
mksource -n hello_cc.cc && \
mksource -n hello_python.py && \
mksource -n hello_shell.sh

# testing win2nix.sh
#docker exec -d $(docker ps -q) win2nix -h

# testing archlinux-python.sh
archlinux-python -h && \
archlinux-python -p python2 && \
archlinux-python -p python3

# testing startup.sh
startup -h && \
startup -t c test.c hello.c && \
startup -t cc test.cc hello.cc
