#This image builds gnuradio with osmocom and hackrf support

The image needs usb access to use the hackrf, so run the following command to pass usb through

sudo docker run --name gr -it --privileged -v /dev/bus/usb:/dev/bus/usb gnuradio bash

After the first run, you must remove the running container and rerun, so use this command:

sudo docker rm gr && sudo docker run --name gr -it --privileged -v /dev/bus/usb:/dev/bus/usb gnuradio bash
