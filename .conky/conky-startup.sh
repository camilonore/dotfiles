#!/bin/sh

if [ "$DESKTOP_SESSION" = "cinnamon" ]; then 
   sleep 20s
   killall conky
   cd "$HOME/.conky/Alfirk"
   conky -c "$HOME/.conky/Alfirk/Alfirk.conf" &
   exit 0
fi
