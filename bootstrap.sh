#!/bin/bash
#------------------------------------------------------------------------------
# Variables
USRDIR=/home/vagrant
mkdir -p ${USRDIR}/local 
chown vagrant.vagrant -R ${USRDIR}/local
#------------------------------------------------------------------------------
# package updates
apt update
# apt upgrade -y

#------------------------------------------------------------------------------
# Desktop
# minimal gui xfce4 https://git.devuan.org/dev1fanboy/Upgrade-Install-Devuan/wikis/minimal-xfce-install
# required for remote desktop: xrdp and vnc4server
# apt install xfce4 xrdp xfce4-terminal vnc4server --no-install-recommends -y
# echo xfce4-session > ${USRDIR}/.xsession 
# cat << EOF > /etc/xrdp/startwm.sh
# #!/bin/sh

# if [ -r /etc/default/locale ]; then
#   . /etc/default/locale
#   export LANG LANGUAGE
# fi
# startxfce4 
# EOF

# apt install fluxbox xrdp x11vnc --no-install-recommends -y # didnt work, 28,9MB
# https://stackoverflow.com/questions/55184262/using-xrdp-to-tunnel-to-an-existing-x-server
# https://github.com/neutrinolabs/xrdp/issues/1028
# cat << EOF > /etc/xrdp/xrdp.ini
# [globals]
#  bitmap_cache=yes 
#  bitmap_compression=yes 
#  port=3389
#  crypt_level=high 
#  channel_code=1 
#  max_bpp=24


#  [xrdp1]
#  name=Remote Desktop
#  lib=libvnc.so
#  username=ask
#  password=ask
#  ip=127.0.0.1
#  port=5900 
# EOF


# apt install fluxbox xrdp vnc4server --no-install-recommends -y # work, 243MB require vagrant pwd

#------------------------------------------------------------------------------
# cleanup 
# apt autoremove -y
# apt clean

#------------------------------------------------------------------------------

# sudo snap install --classic code




# flutter
# cd /tmp && curl -O https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.7.8+hotfix.4-stable.tar.xz
# mkdir ${USRDIR}/local && cd ${USRDIR}/local && tar xvf /tmp/flutter_linux_v1.7.8+hotfix.4-stable.tar.xz
# echo 'export PATH="$PATH:${USRDIR}/flutter/bin"' >> ${USRDIR}/.profile
# source ${USRDIR}/.profile
# flutter precache

# chown vagrant.vagrant -R ${USRDIR}/local ${USRDIR}/.profile ${USRDIR}/.xsession 
