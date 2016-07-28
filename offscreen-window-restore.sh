#!/bin/bash
#
# This script moves back windows that have been moved off screen
#
# Author: Tine Mezgec tine.mezgec@gmail.com
#

width=`xrandr | grep current | awk {'print $8'}`

wmctrl -l -G | awk -v w=$width '{
	if ($8 != "unity-dash" && $8 != "Hud") {
		if ($3 >= w || $3 < 0) {
			system("wmctrl -i -r " $1 " -e 0," sqrt($3*$3) % w ",-1,-1,-1");
		}
	}
}'			

height=`xrandr | grep current | awk {'print $10'} | cut -d ',' -f1`
wmctrl -l -G | awk -v h=$height '{		
	if ($8 != "unity-dash" && $8 != "Hud") {
		if ($4 >= h || $4 < 0) {
			system("wmctrl -i -r " $1 " -e 0,-1," sqrt($4*$4) % h ",-1,-1");
		}
	}
}'

# restart unity to avoid problems with restored windows (unclickable areas)
unity
