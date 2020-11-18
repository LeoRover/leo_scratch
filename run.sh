#!/bin/bash -e

# curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
# sudo apt install nodejs
# nodejs --version

sudo apt update
sudo apt install nodejs

rm -rf /opt/leo_scratch
mkdir -p -m 775 "/opt/leo_scratch"

cp -r repos/scratch3-ros-gui /opt/leo_scratch
cp -r repos/scratch3-ros-parser /opt/leo_scratch
cp -r repos/scratch3-ros-vm /opt/leo_scratch
cp -r example /opt/leo_scratch

pushd /opt/leo_scratch

cd scratch3-ros-parser
npm install
sudo npm link
cd ..

cd scratch3-ros-vm
npm install
sudo npm link
sudo npm link scratch-parser
cd ..

cd scratch3-ros-gui
npm install
sudo npm link
sudo npm link scratch-parser scratch-vm
cd ..

popd

install -v -m 755 files/scratch-start "/usr/bin/"
install -v -m 755 files/scratch-stop "/usr/bin/"
install -v -m 644 files/scratch.service "/etc/systemd/system/"

systemctl enable scratch
