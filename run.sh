#!/bin/bash -e


curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install nodejs
nodejs --version

rm -rf /home/$USER/leo_scratch
mkdir -p -m 775 "/home/$USER/leo_scratch"

cp -r repos/scratch3-ros-gui /home/$USER/leo_scratch
cp -r repos/scratch3-ros-parser /home/$USER/leo_scratch
cp -r repos/scratch3-ros-vm /home/$USER/leo_scratch
cp -r example /home/$USER/leo_scratch

pushd /home/$USER/leo_scratch

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
