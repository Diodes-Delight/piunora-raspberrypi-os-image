#!/bin/sh

SCRIPT=$(cat <<"EOF"
from gpiozero import Button
from time import sleep
import os

def shutdown():
        print("shutdown")
        os.system("shutdown now")

button = Button(26)
button.hold_time = 5
button.when_held = shutdown

while True:
        sleep(0.1)
EOF
)

mkdir -p /usr/local/lib/shutdown_button
echo "$SCRIPT" > /usr/local/lib/shutdown_button/shutdown_button.py


SERVICE=$(cat <<"EOF"
[Unit]
Description=Shutdown Button Service

[Service]
ExecStart=/usr/bin/python /usr/local/lib/shutdown_button/shutdown_button.py

# Disable Python's buffering of STDOUT and STDERR, so that output from the
# service shows up immediately in systemd's logs
Environment=PYTHONUNBUFFERED=1
Restart=on-failure
Type=simple

[Install]
WantedBy=default.target
EOF
)

echo "$SERVICE" > /etc/systemd/system/shutdown-button.service
ln -s /etc/systemd/system/shutdown-button.service /etc/systemd/system/multi-user.target.wants/shutdown-button.service