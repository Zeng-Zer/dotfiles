




#! /bin/bash
frida -q -l ~/.config/scripts/overnotch.js -e "toggleFullScreen()" $(osascript -e 'tell application "System Events" to get unix id of first application process whose frontmost is true')
