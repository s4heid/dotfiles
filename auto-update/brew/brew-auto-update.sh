#!/bin/bash

echo -e "\n`date`: RUNNING: brew update"
/opt/homebrew/bin/brew update
echo "`date`: FINISHED: brew update"

echo -e "\n`date`: RUNNING: brew upgrade"
/opt/homebrew/bin/brew upgrade
echo "`date`: FINISHED: brew upgrade"

echo -e "\n`date`: RUNNING: brew cleanup"
/opt/homebrew/bin/brew cleanup
echo "`date`: FINISHED: brew cleanup"

echo -e "\nAll done! Enjoy a cold one! 🍺 \n"
