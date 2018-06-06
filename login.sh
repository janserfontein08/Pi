#!/bin/bash

# A easy short script that can be placed /etc/bashrc
# When a user ssh's to the server useful info will be
# Displayed on the the screen
# This works best on Centos / Redhat 

RELEASE=`head /etc/redhat-release`
IFS=$'\n'
UPTIME=`uptime`
D_UP=${UPTIME:1}
MYGROUPS=`groups`
DATE=`date`
KERNEL=`uname -sr`
CPWD=`pwd`
ME=`whoami`
CPU=`arch`

printf "\033[1;31m <====  SYSTEM ====> \033[0m\n"
echo   "  Distro info:"$RELEASE""
printf "  Kernel:\t"$KERNEL"\n"
printf "  Uptime:\t"$D_UP"\n" 
printf "  Architecture:\t"$CPU"\n"
printf "  Date:\t\t"$DATE"\n"
printf "\033[0;32m <====  USER ====> \033[0m\n"
printf "  User:\t\t"$ME" (uid:"$UID")\n"
printf "  Groups:\t"$MYGROUPS"\n"
printf "  Working dir:\t"$CPWD"\n"
printf "  Home dir:\t"$HOME"\n"
printf "\033[0;34m <====  NETWORK ====> \033[0m\n"
printf "  Hostname:\t"$HOSTNAME"\n"
ip -o addr | awk '/inet /{print "  IP (" $2 "):\t" $4}'
/sbin/route -n | awk '/^0.0.0.0/{ printf "  Gateway:\t"$2"\n" }'
cat /etc/resolv.conf | awk '/^nameserver/{ printf "  Name Server:\t" $2 "\n"}'
