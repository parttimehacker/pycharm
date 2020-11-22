# pycharm
My PyCharm setup for remote Raspberry Pi configuration. 

This repository contains instructions and bash scripts I use to configure new Raspberry Pi servers. My process is still too manual but its getting better. I use Raspbery Pi Imager to copy the latest image to a SD card. I enable SSH and set up Wi-Fi on the SD card while its still in my laptop. After booting the Pi for the first time I run `sudo raspi-config` to setup passwords, host names, time zone, etc. 

At this point you should clone newpi into the **pi** user home directory. Run the `./start-and-network.sh` bash script to get upgrades and set up file sharing on the network.

I strongly recommend creating a **newuser**, logout of **pi**; login to the **newuser** account and delete the **pi** user to improve your security. 

At this point you need to git clone your applications.

## On the Mac

- Flash the latest Raspberry Pi image to an SD card and then update the mounted boot drive

- Download and run the Raspberry Pi Image Installer at https://www.raspberrypi.org/downloads/

- Reinsert the SD card to get it recognized as **boot** disk

```
cd /Volumes/boot
touch ssh
```
- Edit the wpa supplicant file
```
vi wpa_supplicant.conf
```
- Edit SSID and PASSWORD for your network
```
country=US
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
network={
ssid="SSID"
psk="PASSWORD"
key_mgmt=WPA-PSK
}
```
- Unmount the SD card; insert into your Raspberry Pi and boot.  I like to use a monitor until I get everything up and running. I enable vnc to access the server. 

## First step on your Pi
