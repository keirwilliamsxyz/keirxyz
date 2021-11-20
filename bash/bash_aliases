#///// KEIR WILLIAMS ALIAS MASTER v0.1 NOV 21 /////
#.->.->.->.->.->.->.-><.-<.-<.-<.-<.-<.-<.-<.->.->
#<.-<.-.-><.-<..-><.-<.-<.-<.-<.-<..->.->.->.->.->
#//////////                              //////////  
#                   ,==========,
#                   |   |  |   |
#   <-.             `-./    \.-'          .->
#                      `.__.'
#
#                     keir.xyz
#//////////           ........           //////////
#//////////                              //////////
#.->.->.->.->.->.->.-><.-<.-<.-<.-<.-<.-<.-<.->.->
#<.-<.-.-><.-<..-><.-<.-<.-<.-<.-<..->.->.->.->.->

#////TEST_AREA
alias dpa='sudo docker container pause'
alias dpau='sudo docker container unpause'

#///// FAVOURITES
alias a='sudo nano ~/.bash_aliases'
alias b='. ~/.bashrc'
alias brc='sudo nano ~/.bashrc'
alias n='sudo nano'
alias hist='history|grep'
alias m='sudo mkdir -p'
alias del='mv --force -t ~/.local/share/Trash '
alias cpv='rsync -ah --info=progress2'

#///// LISTING
alais size='sudo du -sh'
alias t='sudo tree -f -h --du --sort=name -C -L '
alias ls='ls --human-readable --size -1 -S --classify'
alias last='ls -t -1' #last modified
alias count='sudo find . -type f | wc -l'

#/////INSTALL
alias useful='sudo apt-get install tree screen iperf3'
alias rcloneinstall='curl https://rclone.org/install.sh | sudo bash'
alias smbinstall='sudo apt-get install samba samba-common && sudo nano sudo nano /etc/samba/smb.conf'

#///// SYSTEMCTL SERVICES /////
alias sysst='systemctl start'
alias sysst='systemctl stop'
alias sysen='systemctl enable'

#///// RCLONE /////
alias rmlog='tail -f -n 5 /home/pi/logs/cron/rmove.log'
alias rmlog2='tail -f -n 5 /home/pi/logs/cron/ab_rmove.log'
alias rcc='sudo nano /home/pi/.config/rclone/rclone.conf'
alias rcn='sudo nano /etc/systemd/system/rclone.service'
alias rcrm='sudo fusermount -uz /mnt/gm'
alias rcst='systemctl stop rclone.service'
alias rcs='systemctl status rclone.service'
alias sysrs='systemctl daemon-reload'

#///// SAMBA SMB /////
alias smb='sudo nano /etc/samba/smb.conf'
alias smbr='sudo systemctl restart smbd'

#///// SCREEN /////
alias s='screen -r'
alias skill='killall screen'
alias sl='screen -ls'

#///// FILESYSTEM /////
alias dspeed='sudo hdparm -Tt /dev/sda1'

#///// LOGGING /////    
alias log='tail -f -n 5'
alias logls='cd /home/pi/logs & ls -h --size -1 -S --classify'

#///// DRIVE MOUNTING /////
alias hdm='df -h -x tmpfs -x devtmpfs' 
alias hdn='sudo nano /etc/fstab'

alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias mhd='sudo mount /dev/sda1 /mnt/hd'
alias uhd='sudo umount /dev/sda1 /mnt/hd'

#/////APT-GET AND INSTALL
alias ap='sudo apt-get install'
alias apup='sudo apt-get update && sudo apt-get upgrade'

#///// PERMISSIONS /////
alias c='sudo chmod -R a=,a+rX,u+w,g+w' #/////Recursively chmod to 775/664
alias cpi='sudo chown -R pi:pi' #/////Recursively chown user=pi group=pi
alias csh='sudo chmod +x' #/////make script exec by user
#/////BACKUP
alias backup='tar --use-compress-program="pigz -k " -cf backup.tar.gz'

#///// DOCKER /////
alias dcd='cd ~/dk/dc'
alias dls='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
#//DOCKER CONTAINER
alias dsp='sudo docker container stop'
alias dst='sudo docker container start'
alias din='sudo docker container inspect'
alias dlog='docker logs'
alias drm='sudo docker container kill'
alias dps='docker container pause'
alias dups='docker container unpause'
#///DOCKER-COMPOSE
alias dsn='sudo nano docker-compose.yml'
alias dcp='sudo touch docker-compose.yml && sudo nano docker-compose.yml'
alias dup='sudo docker-compose up -d'
alias dupv='sudo docker-compose up'
#///DOCKER ALL CONTAINERS
alias dpause='docker pause $(docker ps -a -q)'
alias dstop='docker kill $(docker ps -q)'
alias dstart='docker restart $(docker ps -a -q)'
alias dprune='docker system prune --all --volumes'

#///// PLEX /////
alias plexlib="cd '/mnt/ssd/cf/Library/Application Support/Plex Media Server/'"
alias pants="sudo nano ~/sh/bash/pants.sh"
