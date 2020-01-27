#!/bin/sh
#controll internet
while :
	do
    stat=$(ping -q -c 1 -W 1 8.8.8.8  > /dev/null 2>&1 && echo "ok" || echo "FAIL")
    link=$(swconfig dev switch0 show | fgrep link | grep port:0 | cut -d " " -f 3| cut -d ":" -f 2)
	
    if [ "$stat" = "ok" ]; then
        echo 0 > /sys/class/leds/c50-v3:orange:wan/brightness
        echo 255 > /sys/class/leds/c50-v3:green:wan/brightness
        else 
        if [ "$link" = "down" ]; then
            echo 0 > /sys/class/leds/c50-v3:orange:wan/brightness
            echo 0 > /sys/class/leds/c50-v3:green:wan/brightness
            else
            echo 255 > /sys/class/leds/c50-v3:orange:wan/brightness
            echo 0 > /sys/class/leds/c50-v3:green:wan/brightness
	    fi
    fi
	sleep 10
done