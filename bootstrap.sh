#!/bin/sh
if ! which git &> /dev/null
    then
        sudo pacman -S git
fi

if ! which ansible &> /dev/null
    then
        sudo pacman -S ansible
fi

ansible-galaxy collection install community.general

ansible-playbook bootstrap.yml --connection=loca
