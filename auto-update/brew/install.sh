#!/usr/bin/env bash

set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LABEL="brewautoupdate"
PLIST_PATH=~/Library/LaunchAgents/${LABEL}.plist
LOG_PATH=~/Library/Logs/${LABEL}.log

if [ -f "$PLIST_PATH" ] && launchctl list | grep --quiet "${LABEL}"; then
  echo "Unloading existing launch agent"
  launchctl unload "$PLIST_PATH"
fi

mkdir -p $(dirname $PLIST_PATH)
echo "Creating launch agent $PLIST_PATH"
cat > $PLIST_PATH <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>${LABEL}</string>
  <key>ProgramArguments</key>
  <array>
    <string>${DIR}/brew-auto-update.sh</string>
  </array>
  <key>Nice</key>
  <integer>1</integer>
  <key>StartInterval</key>
  <integer>86400</integer>
  <key>RunAtLoad</key>
  <true/>
  <key>StandardErrorPath</key>
  <string>${LOG_PATH}</string>
  <key>StandardOutPath</key>
  <string>${LOG_PATH}</string>
</dict>
</plist>
EOF

echo "Loading launch agent $PLIST_PATH"
launchctl load "$PLIST_PATH"

echo "Logs: $LOG_PATH"

echo ""
echo "Done"
