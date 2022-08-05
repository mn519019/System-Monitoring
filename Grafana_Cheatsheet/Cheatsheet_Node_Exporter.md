# Cert Expiry Date
(probe_ssl_earliest_cert_expiry {monitor=~"example.*",env=~"$env"} -time())/86400 

# CPU Utilization(%)
100 -(avg by(instance) (rate(node_cpu_seconds_total{instance=~"example.*", zone=~"$zone",job="node exporter",mode="idle",env=~"$env"}[2m]))* 100

# CPU Usage- User(%)
(avg by(instance) (irate(node_cpu_seconds_total{instance=~"example.*",job="node exporter",zone=~"$zone",mode="user",env=~"$env"}[2m])))

# CPU Usage- System(%)
(avg by(instance) (irate(node_cpu_seconds_total{instance=~"example.*",job="node exporter",zone=~"$zone",mode="system",env=~"$env"}[2m])))

# Memory Usage(%)
100-(node_memory_MemAvailable_bytes{ instance=~"example.*", zone=~"$zone",env=~"$env"} * 100) / node_memory_MemTotal_bytes{ instance=~"example.*", zone=~"$zone",env=~"$env"}
