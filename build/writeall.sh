#!/bin/sh
sudo umount "$1"1
sudo umount "$1"2
echo $11
sudo fdisk $1 <<EOF
d
1
d
2
d
3
d
4
w
p
q
EOF

sync


sudo fdisk $1 <<EOF
n
p
1

+4G

n
p
2


p
w
q
EOF


sudo mkfs.vfat "$1"1 &&\
sudo mkfs.ext4 "$1"2 << EOF
y
EOF


sudo dd if=/dev/zero of=$1 bs=1024 seek=8 count=512 &&\
sudo dd if=$_UBOOT_FILE of=$1 bs=1024 seek=8 &&\
sync


sudo mount "$1"1 mnt &&\
sudo cp $_KERNEL_FILE mnt/zImage &&\
sudo cp $_DTB_FILE mnt/ &&\
sudo cp $_BOOT_SCR_FILE mnt/ &&\
sync &&\
sudo umount "$1"1 &&\
sudo umount mnt >/dev/null 2>&1
echo "### write partion 1 ok!"


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
