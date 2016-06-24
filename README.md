# Off-Screen Window Restore
A simple shell script that moves off-screen windows back.

This script was made to fix a bug in unity where if you have multiple monitors, when they wake up after being off some windows move off-screen.

Prerequisites
=============

Install packages required to run the script.

    sudo apt-get install wmctl x11-xserver-utils

Running
=======

Run the script with:

    $ chmod +x ./offscreen-window-restore.sh
    $ ./offscreen-window-restore.sh
