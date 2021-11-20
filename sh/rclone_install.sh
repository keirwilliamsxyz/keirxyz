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
#//RCLONE INSTALL////v0.1/////////////////
#//RCLONE CONFIG VALUES
RC_CF_MV="/home/pi/.config/rclone/rclone.conf"         #git conf imported location
RC_SYS_MV="/etc/systemd/system/rclone.service"         #git service imported location
RC_CF="/home/pi/.config/rclone/rclone.conf"            #local conf location
RC_SYS="/etc/systemd/system/rclone.service"            #local service location
RC_SER="rclone.service"   #rclone service name 
#///RCLONE GIT VALUES   
RC_CF_URL=""                                           #git conf URL
RC_SYS_URL=""
#///INSTALL RCLONE
echo "$L"
echo "$S2 install rclone"
cd ~
sudo wget https://downloads.rclone.org/rclone-current-linux-arm.zip
sudo unzip -j -d rclone-temp rclone-current-linux-arm.zip
sudo mv ~/rclone-temp/rclone /usr/bin/rclone
sudo mv ~/rclone-temp/rclone.1 /usr/share/man/man1/rclone.1
sudo chown root: /usr/bin/rclone
sudo rm ~/rclone-current-linux-arm.zip
sudo rm -r -f ~/rclone-temp§
#//CONFIG RCLONE
echo "$L"
echo "$S2 configure rclone"
sudo git pull "$RC_CF_URL"
sudo mv $RC_CF_MV $RC_CF
sudo chmod -R a=,a+rX,u+w,g+w $RC_CF $RC_SYS
#//TEST RCLONE CONFIG
echo "$L"
echo "$S2 test rclone config"
rclone listremotes --long
#//SETUP RCLONE SERVICE
echo "$L"
echo "$S2 setup rclone service"
sudo git pull "$RC_SYS_URL"
sudo mv $RC_SYS_MV $RC_SYS
sudo systemctl start rclone.service
sudo systemctl enable rclone.service
sudo systemctl daemon-reload
sudo systemctl status rclone.service | tail -f -n 5
#//TEST RCLONE SERVICE
echo "$L"
echo "$S2 test rclone service"
rclone lsd gm: -v
#//EXIT
echo
echo "$L"
echo "$S2 Exit $SH_NAME $TIME"
echo "$S2 Log: [$LOG]"
echo "$L"
echo
exit 0