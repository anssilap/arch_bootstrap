#!/bin/sh
if ! which git &> /dev/null
    then
        sudo pacman -S --noconfirm git
fi

if ! which ansible &> /dev/null
    then
        sudo pacman -S --noconfirm ansible
fi

#TODO install collection only if it doesn't exist
ansible-galaxy collection install community.general

ansible-playbook bootstrap.yml -i inventory.yml --connection=local
