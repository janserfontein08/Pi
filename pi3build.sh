#!/bin/bash

#Building hostname for <<Client name here>> Pi 3

###################################################################################################### 
echo This Script will help keep ClientName hostname to a standard
echo Listed below are the 5 last entries
echo ""
grep panel /etc/openvpn/easy-rsa/keys/* |tail -n 5 |awk '{print $1}'

echo Please enter the number of the panel.
read VARPANEL
echo "Plesae enter the gate (abde)"
read VARGATE
 if [ "$VARGATE" != "a" ] && [ "$VARGATE" != "b" ] && [ "$VARGATE" != "d" ] && [ "$VARGATE" != "e" ]
  then
     echo The gate you have chosen is not invalid.
  else
#    The last script needs to be tested  
     source /etc/openvpn/easy-rsa/eyemagnet-build-key\ panel"$VARPANEL".gate-"$VARGATE".ClientFQDNHere
 fi
