#!/bin/bash

DEST="$HOME/.welcome_recap"

echo "Uninstalling Welcome Recap..."

# Hapus cronjob yang menjalankan auto_screenshot.sh
crontab -l 2>/dev/null | grep -v 'auto_screenshot.sh' | crontab -

# Hapus direktori .welcome_recap
if [ -d "$DEST" ]; then
    rm -rf "$DEST"
    echo "Deleted $DEST"
else
    echo "$DEST not found."
fi

echo "Uninstall complete!"
