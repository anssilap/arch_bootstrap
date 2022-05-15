#!/bin/sh
if ! which git &> /dev/null
    then
        sudo pacman -S --noconfirm git
fi

if ! which ansible &> /dev/null
    then
        sudo pacman -S --noconfirm ansible
fi

# Make sure community.general collection is installed
if ! ansible-galaxy collection verify community.general | grep "Installed collection found at" &> /dev/null
    then
        ansible-galaxy collection install community.general
fi

# Make sure community.general collection is installed
if ! ansible-galaxy collection verify community.crypto | grep "Installed collection found at" &> /dev/null
    then
        ansible-galaxy collection install community.crypto
fi

ansible-playbook bootstrap.yml -i inventory.yml -K --connection=local
