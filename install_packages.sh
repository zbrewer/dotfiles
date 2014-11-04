#!/bin/bash
#
# This script is intended to install all necessary packages
#
# Note: It is also expected that you will have configured another user
# on the system with the appropriate groups and that you will run this
# script as that user using sudo
#
# Written and maintained by: Zach Brewer
#

script_name="install_packages"

USER_HOME=$(getent passwd $SUDO_USER | cut -d: -f6)

SCRIPT_DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

EDITOR=vim

# Must run as root so that we can install packages and move files around
if [ $(whoami) != "root" ]; then
   echo "Error: This script must be run as root"
   exit 1
fi

function reposNotEnabled() {
   echo "You need to enable these before you run this script!"
   echo "You can enable these repos by editing your /etc/pacman.conf:"
   exit 1
}

# All of the packages that need to be installed
DE="i3-wm i3lock i3status xterm conky dmenu"

BROWSERS="firefox chromium"

DEPENDENCIES="git jdk7-openjdk python scala vim htop autoconf automake binutils bison fakeroot flex gcc libtool 
m4 make patch pkg-config ncurses lesspipe tree screen perl hsqldb-java dbus polkit polkit-gnome 
phonon-gstreamer consolekit openssh jshon libcups pycups unzip"

APPLICATIONS="evince thunar alsa-utils cmus irssi banshee feh geeqie gpicview pidgin gimp audacity vlc 
kdesdk-kate kdeedu-kalgebra xfburn file-roller deluge meld nmap filezilla ctags lm_sensors keepassx"

LIBREOFFICE="libreoffice"

EXTRAS="armagetronad ffmpeg flashplugin icedtea-web-java7 librsvg poppler-glib libwebkit curl gvfs polkit-gnome 
thunar-media-tags-plugin thunar-volman tumbler aspell gstreamer0.10-good-plugins gstreamer0.10-ugly-plugins 
aalib avahi flac libcaca libcdio libdvdcss libnotify oss portaudio xosd alsa-lib faad2 libao libmad libmp4v2 
libpulse wavpack xorg-xauth"

AUR_PACKAGES="dropbox speedcrunch archey3 thunar-dropbox google-chrome"

# Functions to actually install things
function installPackages() {
   pacman -Syyu
   pacman -S $DEPENDENCIES
   pacman -S $DE
   pacman -S $BROWSERS
   pacman -S $APPLICATIONS
   pacman -S $LIBREOFFICE
   pacman -S $EXTRAS
}

function installAURPackages() {
   packer -S --noconfirm --noedit $AUR_PACKAGES
}

function printEnd() {
   echo ""
   echo "All done! There are, however some additional steps that you need to take:"
   echo "Edit the conkyrc file to use the proper sensors"
   echo "Setup ACPI if on a laptop"
   echo "Unmute the audio channels with alsamixer and then save the settings with sudo alsactl store"
   echo "Install a network manager and setup WiFi"
   echo "Run Dropbox for a first time and enter your account details"
   echo "Change the output in ~/.i3/config to the right monitor for i3bar and the tray (xrandr to list displays)"
   echo "Run feh --bg-scale PATH_TO_IMAGE to setup a wallpaper"
   echo "Install flake8"
}

function detectSensors() {
   (while :; do echo ""; done ) | sensors-detect
}

function installPacker() {
   cd $USER_HOME
   wget aur.archlinux.org/packages/pa/packer/packer.tar.gz
   tar -xvzf packer.tar.gz
   rm $USER_HOME/packer.tar.gz
   cd $USER_HOME/packer/
   su $SUDO_USER -c "yes | makepkg -s"
   yes | pacman -U packer*.pkg.tar.xz
   cd $USER_HOME
   rm -rf $USER_HOME/packer
}

function doInstall() {
   installPackages
   installPacker
   installAURPackages
   detectSensors
   printEnd
}

# Make sure the user has enabled the appropriate repositories
read -p "Have you enabled the core, extra, and community repositories (y/n)? "
[ $REPLY != "y" ] && reposNotEnabled
[ $REPLY == "y" ] && doInstall
   echo ""
