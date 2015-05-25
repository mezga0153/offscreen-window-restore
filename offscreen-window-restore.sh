#!/bin/bash
#
# This script moves back windows that have been moved off screen
#
# Author: Tine Mezgec tine.mezgec@gmail.com
#

width=`xrandr | grep current | awk {'print $8'}`

`wmctrl -l -G | awk -v w=$width '{
	if ($8 != "unity-dash" && $8 != "Hud") {
		if ($3 >= w || $3 < 0) {
			system("wmctrl -i -r " $1 " -e 0," sqrt($3*$3) % w ",-1,-1,-1");
		}
	}
}'`
