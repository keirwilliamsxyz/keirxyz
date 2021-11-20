#!/bin/bash
#//KEIR.xyz | .sh master v0.1 | November 2021
#//////////////////////////////////////
#//SET DEFAULT VALUES
SH=$(basename -- "$0")
SH_NAME="${SH%.*}"
TIME=$(date +"%T")             #current time
DATE=$(date +"%D")             #current date
USER="keirwilliams"            #default user
PASS="01865kw246589!@"         #default password
EMAIL="keirwilliams@gmail.com" #default email
GM_PATH="/mnt/gm"              #default GDrive mount
SSD_PATH="/mnt/ssd"            #default SSD mount
HOME_PATH="/home/pi"           #default home
SH_PATH="$HOME_PATH/sh/"       #default script path
DK_PATH="$HOME_PATH/dk/"       #default docker path
CF_PATH="$HOME_PATH/cf/"       #default config path
LOG_PATH="/home/logs"          #default log path
LOG="$LOG_PATH/$SH_NAME.log"
U=$(whoami)                    #script user
#//ECHO VALUES
L="///////////////////////////////////////" #line
S2="//"                                     #heading
S="///"                                    #subheading
#//////////////////////////////////////
#///LOG SETUP /////////////////////////
#// Print to log and console.
exec > >(tee -i $LOG_PATH/$LOG.log)
exec 2>&1
#//HEADER
echo
echo "$L"
echo "$S2 keir.xyz | [$DATE $TIME] /////"
echo "$S2 Log: [$LOG]"
echo "$S2 [$SH]"
echo "$L"
#
#//////////////////////////////////////
#//SCRIPT NAME////v0.1/////////////////
#//SET VALUES

#//EXIT
echo
echo "$L"
echo "$S2 Exit $SH_NAME $TIME"
echo "$S2 Log: [$LOG]"
echo "$L"
echo
exit 0
