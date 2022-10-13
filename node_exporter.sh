#!/bin/bash
# semi-automation script
sudo useradd -rs /bin/false node_exporter
sudo mkdir /usr/local/prometheus
sudo chmod 755 /usr/local/prometheus
wget https://github.com/prometheus/node_exporter/releases/download/v1.4.0/node_exporter-1.4.0.linux-amd64.tar.gz
tar -xvf node_exporter-1.4.0.linux-amd64.tar.gz
sleep 2;
sudo mv node_exporter-1.4.0.linux-amd64 /usr/local/prometheus/



# Add in the systemd service node_exporter.service
# Then add below script
# systemctl start node_exporter.service
# systemctl status node_exporter.service 
######## systemd script ####### 
[Unit]
Description=Node Exporter
After=network.target
[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/prometheus/node_exporter-1.4.0.linux-amd64/node_exporter
[Install]
WantedBy=multi-user.target

