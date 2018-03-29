# Docker image for Ubuntu with gnuradio + hackrf support

This image is hosted on Dockerhub here at `pieterbork/gnuradio`

## This container also installs the following packages to receive wifi/bt/zigbee packets

https://github.com/bastibl/gr-foo
https://github.com/rftap/gr-rftap
https://github.com/JiaoXianjun/BTLE
https://github.com/riverloopsec/killerbee
https://github.com/pieterbork/gr-ieee802-11
https://github.com/pieterbork/gr-ieee802-15-4

## Building
    git clone https://github.com/pieterbork/docker-gnuradio.git
    cd docker-gnuradio
    sudo docker build -t gnuradio:latest .


## Running
The image needs usb access to use the hackrf, so run the following command to pass usb through
 
    sudo docker run --name gr -it --privileged -v /dev/bus/usb:/dev/bus/usb gnuradio bash

After the first run, you must remove the running container and rerun, so use this command:

    sudo docker rm gr && sudo docker run --name gr -it --privileged -v /dev/bus/usb:/dev/bus/usb gnuradio bash
