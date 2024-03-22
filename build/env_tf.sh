#!/bin/bash
export _TOP_DIR=$PWD/..
export _UBOOT_DIR=$_TOP_DIR/u-boot
export _KERNEL_DIR=$_TOP_DIR/Linux
export _ROOTFS_DIR=$_TOP_DIR/buildroot-2021.02.4
export _DOCU_DIR=$_TOP_DIR/document
export _DT_NAME=suniv-f1c100s-licheepi-nano

export _UBOOT_FILE=$_UBOOT_DIR/u-boot-sunxi-with-spl.bin
export _KERNEL_FILE=$_KERNEL_DIR/arch/arm/boot/zImage
export _DTB_FILE=$_KERNEL_DIR/arch/arm/boot/dts/$_DT_NAME.dtb
export _BOOT_SCR_FILE=$_TOP_DIR/Build/boot.scr
export _ROOTFS_FILE=$_ROOTFS_DIR/output/images/rootfs.tar
export _MOD_FILE=$_KERNEL_DIR/out/lib/modules
