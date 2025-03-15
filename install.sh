#!/bin/bash

SOURCEPOD64=$(pwd)

cd $SOURCEPOD64/build/essential/script.sh.d/
echo "arch=pod64-docker" >> ~/.bashrc
source ~/.bashrc
echo "curl https://raw.githubusercontent.com/nogeese-org/mirror/main/nogeese/os/$arch/setup.sh | sudo bash" >> pacman.sh
echo "curl https://raw.githubusercontent.com/nogeese-org/mirror/main/bit/os/$arch/setup.sh | sudo bash" >> pacman.sh
bash pacman.sh
cd $SOURCEPOD64/build
mkdir appsrc
cd appsrc
curl -sSL https://raw.githubusercontent.com/nogeese-org/InfoKit/main/installer/install.sh | sudo bash
cd ../sys
git clone https://github.com/nogeese-org/stable.git ~/master
cd master
bash architectures/pod64-docker.sh
bash scripts/appsetup.sh
cd ../../appsrc
git clone https://github.com/nogeese-org/podutils-docker.git ~/podutils
cd podutils
bash scripts/flush.sh
clear
echo "This message was automaticly sent."
echo "The system is ready to use."
exit 1
