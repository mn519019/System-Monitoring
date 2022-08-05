### Cert Expiry Date
(probe_ssl_earliest_cert_expiry {monitor=~"example",env=~"$env"} -time())/86400 

### CPU Utilization(%)
100 -(avg by(instance) (rate(node_cpu_seconds_total{instance=~"example", zone=~"$zone",job="node exporter",mode="idle",env=~"$env"}[2m]))* 100

### CPU Usage- User(%)
(avg by(instance) (irate(node_cpu_seconds_total{instance=~"example",job="node exporter",zone=~"$zone",mode="user",env=~"$env"}[2m])))

### CPU Usage- System(%)
(avg by(instance) (irate(node_cpu_seconds_total{instance=~"example",job="node exporter",zone=~"$zone",mode="system",env=~"$env"}[2m])))

### Memory Usage(%)
100-(node_memory_MemAvailable_bytes{ instance=~"example", zone=~"$zone",env=~"$env"} * 100) / node_memory_MemTotal_bytes{ instance=~"example.*", zone=~"$zone",env=~"$env"}

### Disk Space Usage(%)
100 - (node_filesystem_avail_bytes * 100) / node_filesystem_size_bytes { instance=~"example", zone=~"$zone", mountpoint="/",env=~"$env"}

### Network Traffic In and out 
irate(node_network_receive_bytes_total{instance=~'example', zone=~"$zone", device="eth0",env=~"$env"}[5m])*8 or irate(node_network_receive_bytes{instance=~'example', zone="$zone", device="eth0",env=~"$env"}[5m])*8

irate(node_network_transmit_bytes_total{instance=~"example",zone=~"$zone",env=~"$env", device="eth0"}[5m])*8 or irate(node_network_transmit_bytes{instance=~"example", zone="$zone",env=~"$env", device="eth0"}[5m])*8

### Basic Load 1 min, 5 min, 15min 
node_load1 {instance=~"example", zone=~"$zone",env=~"$env"}
node_load5 {instance=~"example", zone=~"$zone",env=~"$env"}
node_load15 {instance=~"example", zone=~"$zone",env=~"$env"}

### SystemD Monitoring - Restarting 
node_systemd_unit_state{ instance=~"example", name="example.service", state="activating", zone=~"$zone",env=~"$env" }
