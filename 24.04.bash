t#!/bin/bash

# chmod +x setup-pc.bash
# ./setup-pc.bash

# Made for Ubuntu 22.04

sudo apt update && sudo apt upgrade
# Install git
sudo apt-get install git

# Installing ROS 2 Humble Hawksbill via Debian Packages
locale  # check for UTF-8
sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
sudo apt install software-properties-common
sudo add-apt-repository universe

apt-cache policy | grep universe
sudo apt update && sudo apt install curl gnupg lsb-release

sudo apt update && sudo apt install -y \
  build-essential \
  cmake \
  git \
  python3-colcon-common-extensions \
  python3-flake8 \
  python3-flake8-blind-except \
  python3-flake8-builtins \
  python3-flake8-class-newline \
  python3-flake8-comprehensions \
  python3-flake8-deprecated \
  python3-flake8-docstrings \
  python3-flake8-import-order \
  python3-flake8-quotes \
  python3-pip \
  python3-pytest \
  python3-pytest-cov \
  python3-pytest-repeat \
  python3-pytest-rerunfailures \
  wget

sudo apt install ros-humble-desktop
source /opt/ros/humble/setup.bash
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
echo "export ROS_DOMAIN_ID=71" >> ~/.bashrc

# colcon
sudo apt install python3-colcon-common-extensions
echo "source /usr/share/colcon_cd/function/colcon_cd.sh" >> ~/.bashrc
echo "export _colcon_cd_root=/opt/ros/humble/" >> ~/.bashrc
echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> ~/.bashrc

# Install latex
# sudo add-apt-repository ppa:jonathonf/texlive
sudo apt install texlive-full
tlmgr install abntex2
tlmgr update abntex2
tlmgr init-usertree

# Install Opencv
sudo apt update
sudo apt install libopencv-dev python3-opencv
python3 -c "import cv2; print(cv2.__version__)"

# apks
sudo apt install gimp
sudo apt install inkscape
sudo apt install okular
sudo apt install vlc
sudo apt install terminator

# fatpack
sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
# config flatpack repo
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Install telegram

# Install vscode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code

# Install Brave
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

qdbus org.kde.CrowTranslate /org/kde/CrowTranslate/MainWindow recognizeScreenArea

# rustdesk

# crow-translate
flatpak install flathub org.kde.CrowTranslate
sudo apt install qdbus-qt5 qdbus-qt5 -y
# criar atalho:
# ctrl + alt + e
# qdbus org.kde.CrowTranslate /org/kde/CrowTranslate/MainWindow translateSelection
# OCR não está funcionando cm o crow translate
# 
# Screen OCR used by crow-translate
sudo apt install tesseract-ocr tesseract-ocr-eng tesseract-ocr-por tesseract-ocr-chi-sim
sudo apt install cmake extra-cmake-modules qtbase5-dev qt6-base-dev qt6-declarative-dev tesseract-ocr 


# OBS
sudo apt install ffmpeg
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update && sudo apt install obs-studio

# gnome tweaks
sudo apt install gnome-tweaks

# Flatpaks

# snaps
sudo snap install gitkraken --classic
sudo snap install onlyoffice-desktopeditors
sudo snap install drawio
sudo snap install logseq

# install code dependencies
sudo apt install gdb
sudo apt install pipx
pipx install flawfinder
pipx install lizard
sudo apt install cppcheck
sudo apt install clang

# boomaga: print booklets
sudo apt install boomaga -y

# lightweight system monitor
sudo apt-get install conky-all -y # ou compilar do repositório fonte
# conky dependencies
sudo apt install lm-sensors nvme-cli curl jq -y
sudo apt install libcairo2-dev libxnvctrl-dev -y
sudo apt install cmake libimlib2-dev libncurses5-dev libx11-dev libxdamage-dev libxft-dev libxinerama-dev libxml2-dev libxext-dev libcurl4-openssl-dev liblua5.3-dev -y
# allow the use of iwconfig without needing root:
echo "$USER $HOSTNAME = (root) NOPASSWD: /sbin/iwconfig" | sudo tee -a /etc/sudoers

# dependencias para instalar extensões no gerenciador de arquivos nautilus
#sudo apt install libnautilus-extension1a git python3.8 python3-requests python3-nautilus python3-gi -y
 
# config HISTFILE and HISTFILESIZE to infinity
sed -i 's/^HISTSIZE=.*/HISTSIZE=10000/' ~/.bashrc
sed -i 's/^HISTFILESIZE=.*/HISTFILESIZE=-1/' ~/.bashrc

# docker
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo docker run hello-world
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# Piper TTS
# Install xsel: select screen text easily
sudo apt install xsel -y
cd ~/
wget https://github.com/rhasspy/piper/releases/download/v1.2.0/piper_amd64.tar.gz
tar -xvzf piper_amd64.tar.gz
rm piper_amd64.tar.gz
cd piper
# pt-BR voice
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pt/pt_BR/faber/medium/pt_BR-faber-medium.onnx
wget https://huggingface.co/rhasspy/piper-voices/raw/v1.0.0/pt/pt_BR/faber/medium/pt_BR-faber-medium.onnx.json
# en-US voice
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/libritts/high/en_US-libritts-high.onnx
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/libritts/high/en_US-libritts-high.onnx.json
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/lessac/medium/en_US-lessac-medium.onnx
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/lessac/medium/en_US-lessac-medium.onnx.json

# test
echo "Olá mundo!" | ~/piper/piper --model ~/piper/pt_BR-faber-medium.onnx --output-raw | aplay -r 22050 -f S16_LE -t raw
echo "Hello World!" | ~/piper/piper --model ~/piper/en_US-libritts-high.onnx --output-raw | aplay -r 22050 -f S16_LE -t raw
echo "Hello World!" | ~/piper/piper --model ~/piper/en_US-lessac-medium.onnx --output-raw | aplay -r 22050 -f S16_LE -t raw

# need to add the shortcuts

# Mimic 3 TTS
sudo apt-get install libespeak-ng1 xsel -y

python3 -m venv .venv
source .venv/bin/activate
pip3 install --upgrade pip
pip3 install mycroft-mimic3-tts[all]
echo 'export PATH="$PATH:~/.local/bin"' >> ~/.bashrc
source ~/.bashrc
# Test
mimic3 'Hello world.' | aplay

# need to add the shortcuts

# input remapper: remap input keys
sudo apt install input-remapper-gtk -y
sudo systemctl enable --now input-remapper

# install syncthing
# Add the release PGP keys:
sudo mkdir -p /etc/apt/keyrings
sudo curl -L -o /etc/apt/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
# Add the "stable" channel to your APT sources:
echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
# Update and install syncthing:
sudo apt-get update
sudo apt-get install syncthing -y

# add fingerprint support
# https://ubuntuhandbook.org/index.php/2024/02/fingerprint-reader-t480s/
sudo apt remove fprintd
# sudo add-apt-repository ppa:uunicorn/open-fprintd
sudo add-apt-repository ppa:ubuntuhandbook1/open-fprintd
sudo apt-get update
sudo apt install open-fprintd fprintd-clients python3-validity -y
systemctl status python3-validity.service
sudo pam-auth-update
# reboot para ter efeito


# install locate
sudo apt install locate
sudo updatedb
# add updatedb as a command to be ran every hour
(sudo crontab -l 2>/dev/null; echo "0 * * * * /usr/bin/updatedb") | sudo crontab -

# add pt-BR support to logseq dictionary
sudo sed -i 's/"dictionaries":\["en-US"\]/"dictionaries":["en-US", "pt-BR"]/' $(locate logseq | grep Preferences)

# to manage gnome extensions
flatpak install flathub com.mattjakeman.ExtensionManager

# flameshot, tool to get screenshots
sudo apt install flameshot

# install calibre e-book manager
sudo apt install libxcb-cursor0
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

# install dotnet e runtime
sudo apt-get update &&   sudo apt-get install -y dotnet-sdk-8.0 aspnetcore-runtime-8.0

# install fritzing - Software for circuits design
sudo apt install fritzing*
