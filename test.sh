#!/bin/sh
if ! ansible-galaxy collection verify community.general | grep "Installed collection found at" &> /dev/null
    then
        echo "community.general found"
    else 
        echo "community.general not found"
fi
