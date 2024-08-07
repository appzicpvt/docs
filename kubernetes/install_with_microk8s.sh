#!/bin/bash

sudo apt update

sudo snap install microk8s --classic --channel=1.30

sudo usermod -a -G microk8s $USER
mkdir -p ~/.kube
chmod 0700 ~/.kube

echo ""
read -p "Do you want alias kubectl commands to k ? [Y/n]: " alias_k

if [ "$alias_k" = "Y" ] || [ "$alias_k" = "y" ]; then
    sh docs/kubernetes/alias_k.sh
fi

echo ""
read -p "Do you want reboot server? [Y/n]: " will_reboot

if [ "$will_reboot" = "Y" ] || [ "$will_reboot" = "y" ]; then
    sudo reboot
fi
