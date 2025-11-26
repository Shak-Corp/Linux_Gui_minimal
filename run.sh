#!/bin/bash
# Sync persistent files from GitHub
/usr/local/bin/sync-persist.sh pull

# Start supervisor (VNC + noVNC + GUI)
usr/bin/supervisord -n
