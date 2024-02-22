#!/bin/bash

# chmod +x setup-pc.bash
# ./setup-pc.bash

# Made for Ubuntu 22.04

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
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update && sudo apt upgrade
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
  python3-rosdep \
  python3-setuptools \
  python3-vcstool \
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
sudo apt install flatpak

# config flatpack repo
flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Notion desktop
echo "deb [trusted=yes] https://apt.fury.io/notion-repackaged/ /" | sudo tee /etc/apt/sources.list.d/notion-repackaged.list
sudo apt update
sudo apt install notion-app-enhanced

# Install telegram
wget "https://telegram.org/dl/desktop/linux" -O telegram.tar.xz
sudo tar -xvf telegram.tar.xz -C /opt
sudo mv /opt/Telegram /opt/telegram-desktop
sudo ln -sf /opt/telegram-desktop/Telegram /usr/bin/telegram
echo -e '\n[Desktop Entry]\nName=Telegram\nExec=/opt/telegram-desktop/Telegram\nIcon=/opt/telegram-desktop/Telegram\nType=Application\nCategories=Network;InstantMessaging;' | sudo tee /usr/share/applications/telegram.desktop

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

# Install element
sudo apt install -y wget apt-transport-https
sudo wget -O /usr/share/keyrings/element-io-archive-keyring.gpg https://packages.element.io/debian/element-io-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/element-io-archive-keyring.gpg] https://packages.element.io/debian/ default main" | sudo tee /etc/apt/sources.list.d/element-io.list
sudo apt update
sudo apt install element-desktop

# rustdesk
wget https://github.com/rustdesk/rustdesk/releases/download/1.1.9/rustdesk-1.1.9.deb
mkdir -p newpack oldpack/DEBIAN
dpkg-deb -x rustdesk-1.1.9.deb oldpack
dpkg-deb -e rustdesk-1.1.9.deb oldpack/DEBIAN/
sed -i "s/pulseaudio/pulseaudio | pipewire-pulse/g" oldpack/DEBIAN/control
dpkg-deb -Z xz -b oldpack newpack
sudo dpkg -i newpack/rustdesk_1.1.9_amd64.deb
rm -d -r oldpack newpack

# crow-translate
sudo add-apt-repository ppa:jonmagon/crow-translate
sudo apt update
sudo apt install crow-translate
# Screen OCR used by crow-translate
sudo apt install tesseract-ocr tesseract-ocr-eng tesseract-ocr-por tesseract-ocr-chi-sim

# OBS
sudo apt install ffmpeg
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update && sudo apt install obs-studio

# gnome tweaks
sudo apt install gnome-tweaks

# Flatpaks
flatpak install flathub org.onlyoffice.desktopeditors
flatpak install flathub com.axosoft.GitKraken
flatpak install flathub com.jgraph.drawio.desktop
flatpak install flathub com.bitwarden.desktop
flatpak install flathub com.logseq.Logseq

# install code dependencies
sudo apt install gdb
sudo pip install lizard
sudo pip install flawfinder
sudo apt install cppcheck
sudo apt install clang

# boomaga: print booklets
sudo apt install boomaga -y

# lightweight system monitor
sudo apt-get install conky -y # ou compilar do repositório fonte
# conky dependencies
sudo apt install lm-sensors hddtemp nvme-cli curl jq
sudo apt install libcairo2-dev libxnvctrl-dev
sudo apt install cmake libimlib2-dev libncurses5-dev libx11-dev libxdamage-dev libxft-dev libxinerama-dev libxml2-dev libxext-dev libcurl4-openssl-dev liblua5.3-dev
# allow the use of iwconfig without needing root:
echo "$USER $HOSTNAME = (root) NOPASSWD: /sbin/iwconfig" | sudo tee -a /etc/sudoers

# dependencias para instalar extensões no gerenciador de arquivos nautilus
sudo apt install libnautilus-extension1a git python3.8 python3-requests python3-nautilus python3-gi -y
 
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
# voz pt-BR
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pt/pt_BR/faber/medium/pt_BR-faber-medium.onnx
wget https://huggingface.co/rhasspy/piper-voices/raw/v1.0.0/pt/pt_BR/faber/medium/pt_BR-faber-medium.onnx.json
# test
echo "Olá mundo!" | ~/piper/piper --model ~/piper/pt_BR-faber-medium.onnx --output-raw | aplay -r 22050 -f S16_LE -t raw

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
