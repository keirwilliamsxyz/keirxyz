# /bin/bash
docker run -d --restart=always -v /mnt/sd/jd:/dl/jd -v /home/pi/dk/cf/jd:/opt/JDownloader/cfg --name jd -u 1000:1000 jaymoulin/jdownloader
