#!/bin/sh
sudo mount "$1"1 mnt &&\
sudo cp $_KERNEL_FILE mnt/zImage &&\
sudo cp $_DTB_FILE mnt/ &&\
sudo cp $_BOOT_SCR_FILE mnt/ &&\
sync &&\
sudo umount "$1"1 &&\
sudo umount mnt >/dev/null 2>&1
echo "### write partion 1 ok!"
