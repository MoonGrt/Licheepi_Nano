#!/bin/sh
sudo mount "$1"2 mnt &&\
sudo rm -rf mnt/* &&\
sudo tar -xvf $_ROOTFS_FILE -C mnt/ &&\
sudo mkdir -p mnt/lib/modules/ &&\
sudo cp -r $_MOD_FILE/* mnt/lib/modules/ &&\
sudo cp -R $_DOCU_DIR/* mnt/root/
sudo umount "$1"2 &&\
sync &&\
echo "### write partion 2 ok!"
sudo umount mnt >/dev/null 2>&1