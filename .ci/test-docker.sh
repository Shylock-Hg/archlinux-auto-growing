#! /usr/bin/env sh

###############################################################################
# testing docker and scripts in docker
###############################################################################

set -e

# testing mksource.sh
docker exec -d $(docker ps -q) mksource -h && \
docker exec -d $(docker ps -q) mksource -n Makefile && \
docker exec -d $(docker ps -q) mksource -n hello_c.h && \
docker exec -d $(docker ps -q) mksource -n hello_c.c && \
docker exec -d $(docker ps -q) mksource -n hello_cc.hh && \
docker exec -d $(docker ps -q) mksource -n hello_cc.cc && \
docker exec -d $(docker ps -q) mksource -n hello_python.py && \
docker exec -d $(docker ps -q) mksource -n hello_shell.sh

# testing win2nix.sh
#docker exec -d $(docker ps -q) win2nix -h

# testing archlinux-python.sh
docker exec -d $(docker ps -q) archlinux-python -h && \
docker exec -d $(docker ps -q) archlinux-python -p python2 && \
docker exec -d $(docker ps -q) archlinux-python -p python3

# testing startup.sh
docker exec -d $(docker ps -q) startup -h && \
docker exec -d $(docker ps -q) startup -t c test.c hello.c && \
docker exec -d $(docker ps -q) startup -t cc test.cc hello.cc
