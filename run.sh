#!/bin/bash -e

if [ "$(id -u)" != "0" ]; then
	echo "Please run this script as root" 1>&2
	exit 1
fi

apt update
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
apt install nodejs
nodejs --version
npm --version

# sudo apt update
# sudo apt install nodejs

rm -rf /opt/leo_scratch
mkdir -p -m 775 "/opt/leo_scratch"

cp -r repos/scratch3-ros-gui /opt/leo_scratch
cp -r repos/scratch3-ros-parser /opt/leo_scratch
cp -r repos/scratch3-ros-vm /opt/leo_scratch
cp -r example /opt/leo_scratch

pushd /opt/leo_scratch

cd scratch3-ros-parser
npm install
npm link
cd ..

cd scratch3-ros-vm
npm install
npm link
npm link scratch-parser
cd ..

cd scratch3-ros-gui
npm install
npm link
npm link scratch-parser scratch-vm
cd ..

popd

install -v -m 755 files/scratch-start "/usr/bin/"
install -v -m 755 files/scratch-stop "/usr/bin/"
install -v -m 644 files/scratch.service "/etc/systemd/system/"

systemctl enable scratch
