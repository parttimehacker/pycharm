# pycharm
My PyCharm setup for remote Raspberry Pi configuration hosted on Mac Book Pro. 

This repository contains instructions and bash scripts I use to configure new Raspberry Pi servers. My process is still too manual but its getting better. I use Raspbery Pi Imager to copy the latest image to a SD card. I enable SSH and set up Wi-Fi on the SD card while its still in my laptop. After booting the Pi for the first time I run `sudo raspi-config` to setup passwords, host names, time zone, etc. 

I strongly recommend creating a **newuser**, logout of **pi**; login to the **newuser** account and delete the **pi** user to improve your security. 

At this point you should clone pycharm into the **newuser** user home directory. Run the `./pycharm.sh` bash script to get upgrades and set up file sharing on the network.

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

- Do the basic stuff like timezone, pi password, update, etc.
- Run raspi-config from the Preferences menu
```
Preferences > Raspberry Pi Configuration
```
- Change hostname; enable VNC, SPI, I2C; add memory to graphics

## Lets add some security starting with a new user

- Create a **newuser** and password
```
sudo useradd -m newuser -G sudo
sudo passwd newuser
```
- Add a no password required for **newuser** at the bottom
```
sudo visudo
newuser ALL=NOPASSWD: ALL
```
- Logout and login as the **newuser**
- Remove the **pi** user and /home/pi:
```
sudo deluser -remove-home pi
```
- Download the GitHub repositiory git clone `pycharm` 
```
https://github.com/parttimehacker/pycharm.git
```
- Make pycharm.sh executable and run the script
```
cd pycharm
chmod +x *.sh
./pycharm.sh
```
- NOTE - Raspberry pi buster release has an issue with netatalk. You need to add home to the conf
```
sudo vi /etc/netatalk/afp.conf
```
- Add the following at the bottom
```
[Homes]
  basedir regex = /home
```
- It is a good idea to reboot and test the network

## Setup VNC to elminate the need for an HDMI cable and monitor
- Open VNC
```
Menu > Options > Security
Encryption > Prefer off
Authentication > VNC password
Menu > Options > Users & Permissions
Password xxx and confirm
```
- Test from Mac Book Pro

## Create PyCharm project on Mac Book Pro
- Next step is to build the environment



