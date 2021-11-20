#!/bin/bash
echo "///////////////////////////////////////"
echo " $date"
echo "///////////////////////////////////////"
echo 

#   Get raspibian and instatll to an SD
## All Values

#RASP_URL=Latest Raspbian Lite image URL:
#RASP_URL_ZIPPED=Raspbian_lite_latest.zip
#RASP_DIR=Download Dir
#RASP_IMG=Raspbian_lite_latest.img
#sd= SD card user input

RASP_DIR='/home/pi/ap/rasp'
SD_LS=$(lsblk --nodeps --list /dev/sda1 /dev/sdb1 -o 'NAME,SIZE,MOUNTPOINT')

#make folder for image
mkdir -p $RASP_DIR
chmod -R a=,a+rX,u+w,g+w $RASP_DIR
chown -R pi:pi $RASP_DIR
cd $RASP_DIR

RASP_URL=`curl -s https://downloads.raspberrypi.org/raspbian_lite_latest \
    | grep -o '<a href=['"'"'"][^"'"'"']*['"'"'"]' \
    | sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//'`


RASP_URL_ZIPPED=`echo $RASP_URL | awk -F"/" '{print $7}'`

wget -nc $RASP_URL
echo
echo "//$RASP_URL Downloaded to $RASP_DIR"
echo
echo "///////////////////////////////////////"
echo "//UNZIPPING///////////////////////////"
unzip -n -o $RASP_URL_ZIPPED -d $RASP_DIR | pv -l >/dev/null
RASP_IMG=`echo $RASP_URL_ZIPPED | sed 's/.zip/.img/g'`
echo "//Raspbian_lite_latest Image file:"
echo $RASP_IMG
echo "///////////////////////////////////////"
echo "//////////Available Cards"
#echo $SD_LS
lsblk --nodeps --list /dev/sda1 /dev/sdb1 -o 'NAME,SIZE,MOUNTPOINT'
echo "////////////////////////////////////////"
echo "//Which Drive sda or sdb?"
    read SD
echo
echo "////////////////////////////////////////"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ">>> Burn $RASP_DIR/$RASP_IMG to $SD? <<<"
echo 
read -p "Are you sure? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
echo "////////////////////////////////////////"
echo "Burning raspbian lite to $SD"
echo echo "////////////////////////////////////////"
echo
echo "////////////////////////////////////////"
echo "////////////////////////////////////////"
echo
then
sudo dd bs=4M if=$RASP_IMG of=/dev/$SD status=progress
echo
fi
 echo "OK, BYE THEN..."
exit 1

###########
#Setup Pi Headless

    echo "//////>>>> Setup Headless Pi <<<<//////"
    echo 
    read -p "Are you sure? " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]

    # Get the device name of the Linux file system (with partition #)  
    # to use to mount after the image is written

    echo "///////////////////////////////////////"
    echo "///////////////////////////////////////"
    echo "//MOUNTING RASP NEW SD/////////////////"
    echo "///////////////////////////////////////"

    PI_BLK=$(sudo fdisk -l | tail -1 | awk '{print $1}')
    PI_MNT="/mnt/pi"
    echo "/////LINUX MOUNT $PI_BLK @ $PI_MNT"
    echo "///////////////////////////////////////"

    PI_BLK32=$(sudo fdisk -l | tail -2 | head -1 | awk '{print $1}')
    PI_MNT32="/mnt/pi32"
    echo "/////FAT32 MOUNT $PI_BLK @ $PI_MNT"
    echo "///////////////////////////////////////"

    #mount linux partiiton
    sudo mkdir -p $PI_MNT
    sudo mount $PI_BLK $PI_MNT

    #mount fat32 partition
    sudo mkdir -p $PI_MNT32
    sudo mount $PI_BLK32 $PI_MNT32

    echo "///////////////////////////////////////"
    echo "//SETUP HEADLESS - WIFI & SSH//////////"
    ###############################
    # Customize the WPA supplicant in linux partition
    sudo cat <<EOF > /mnt/pi/etc/wpa_supplicant/wpa_supplicant.conf
    ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
    update_config=1
    country=GB
    network={
         ssid="WiFly"
         psk="wearefly"
         key_mgmt=WPA-PSK
    }
    EOF
    ###############################
    #touch ssh into fat32 partition
    sudo touch /mnt/pi32/ssh

    echo "////////////////////////////////////////"
    echo "///////SUCCESSFULLY SETUP PI @ $PI_MNT"
    echo "////////////////////////////////////////"
    echo
    echo "//UNMOUNTING FAT32 $PI_MNT/////////////"
    echo "//UNMOUNTING LINUX $PI_MNT32///////////"
    echo "///////////////////////////////////////"
    sudo umount -lq /mnt/pi
    sudo umount -lq /mnt/pi32
    echo
    echo "BYE THEN!!/////////////////////////////"
    echo "///////////////////////////////////////"
    exit 0  
    
###############################
#Dont' Setup and exit with 1

        fi
            echo "BYE! HAVE-A-NICE-TIME!/////////////////"
            echo "///////////////////////////////////////"
            exit 1


