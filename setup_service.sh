#!/bin/bash

# Check if running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Please use sudo or run as root user."
    exit 1
fi

# Create the systemd service file
cat > /etc/systemd/system/xmrig.service << 'EOL'
[Unit]
Description=XMRig Miner Service
After=network.target
Wants=network-online.target

[Service]
Type=simple
ExecStart=/root/xmrig -c /root/config.json
WorkingDirectory=/root
Restart=always
RestartSec=15
User=root
Group=root
Nice=10
CPUWeight=50

# Security measures
PrivateTmp=true
ProtectSystem=full
NoNewPrivileges=true

[Install]
WantedBy=multi-user.target
EOL

# Reload systemd to recognize the new service file
systemctl daemon-reload

# Enable the service to start at boot
systemctl enable xmrig.service

# Start the service
systemctl start xmrig.service

# Check service status
echo "XMRig service has been created and started."
echo "Service status:"
systemctl status xmrig.service --no-pager

echo -e "\nSetup complete! The XMRig service is now running and will start automatically on boot."
echo "You can check the service logs using: journalctl -u xmrig.service"
