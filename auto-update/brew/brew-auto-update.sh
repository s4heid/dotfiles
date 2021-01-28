#!/bin/bash

echo -e "\n`date`: RUNNING: brew update"
/usr/local/bin/brew update
echo "`date`: FINISHED: brew update"

echo -e "\n`date`: RUNNING: brew upgrade"
/usr/local/bin/brew upgrade
echo "`date`: FINISHED: brew upgrade"

echo -e "\n`date`: RUNNING: brew cleanup"
/usr/local/bin/brew cleanup
echo "`date`: FINISHED: brew cleanup"

echo -e "\nAll done! Enjoy a cold one! 🍺 \n"
