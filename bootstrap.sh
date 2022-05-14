#!/bin/sh
if ! which git &> /dev/null
    then
        sudo pacman -S --noconfirm git
fi

if ! which ansible &> /dev/null
    then
        sudo pacman -S --noconfirm ansible
fi

#TODO install community.general collection only if it doesn't exist
if ! ansible-galaxy collection list | grep community.general &> /dev/null
    then
        ansible-galaxy collection install community.general
fi

ansible-playbook bootstrap.yml -i inventory.yml -K --connection=local
