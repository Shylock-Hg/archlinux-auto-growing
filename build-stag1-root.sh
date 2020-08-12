#! /usr/bin/env sh

###############################################################################
#!  \brief auto build the host environment after new os installation
#          which base on base packages
#   \author Shylock Hg
#   \date 2018-12-22
#   \email tcath2s@gmail.com
###############################################################################

set -e;

# environament variable for system package manager
readonly packages="\
        sudo binutils make gcc pkg-config fakeroot gettext \
        git vim wget gdb clang lldb cmake \
        openssh boost boost-libs valgrind man man-pages \
        python-pip python2-pip ruby nodejs yarn \
        cronie \
        ttf-hack \
        xorg-xinit xfce4 xfce4-goodies \
        firefox \
        docker docker-compose \
"

# root
eval \
echo "root:${CI_ROOT_PASSWORD}" | chpasswd && \
echo 'root ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
\
# upgrade system
pacman --noconfirm -Syu && \
\
# install the softwares
pacman --noconfirm --needed -Sy $packages && \
\
# add the user
useradd -m -g users -G wheel -s /bin/bash shylock && \
echo 'shylock ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
echo "shylock:${CI_USER_PASSWORD}" | chpasswd && \
\
# shylock
sudo -Hu shylock sh ./build-stag2-shylock.sh

