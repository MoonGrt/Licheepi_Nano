#!/bin/sh
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
