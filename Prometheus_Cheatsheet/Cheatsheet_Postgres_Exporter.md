
## Postgres Exporter Cheatsheet ##
Below formulas are mostly used to build grafana dashboards. 
I have referenced https://schh.medium.com/monitoring-postgresql-databases-using-postgres-exporter-along-with-prometheus-and-grafana-1d68209ca687 for building postgres exporter this time. 
Feel free to reference them in your dashboard, this cheatsheet only includes some customized dashboard values so the rest of them available in above blogs.
Please use **6742** ID to import projects and customize your Grafana dashboards as you need! 

### Variables 
- $monitor = Monitor all instances that are grouped for "example". 
- $instance = server name a.k.a domain name
- $datname = user name in postgres DB
- $mod = lock name
- $server = local port being used on a server

##
#### Postgres Exporter Authentication Status
pg_up{instance=~"tools-pg.*"} == 1

#### Postgres SQL Status
node_systemd_unit_state{instance="tools-pg.*", name="postgresql.service", state="active"}

#### Free Storage Space Average
node_filesystem_avail_bytes{instance="$instance"}

#### PSQL Version 
Version

#### Database Read IOps Average
irate(node_disk_read_bytes_total{instance="$instance"}[5m]) / 1024 / 1024

#### Database Write IOps Average
irate(node_disk_writes_completed_total{instance="$instance"}[5m]) / 1024 / 1024

#### Database Read Latency Average
rate(node_disk_read_time_seconds_total{instance="$instance"}[2m]) / rate(node_disk_reads_completed_total{instance=~"$instance"}[2m])

#### Database Write Latency Average
rate(node_disk_write_time_seconds_total{instance="$instance"}[5m]) / rate(node_disk_writes_completed_total{instance=~"$instance"}[5m])

#### Active Sessions
pg_stat_activity_count{instance=~"$instance",server="$server", datname="$datname", state="active"} !=0

#### Lock Tables
pg_stat_activity_count{instance=~"$instance",server="$server", datname="$datname", state="active"} !=0

#### Database Connections Average
 increase (pg_stat_activity_count {instance="$instance"}[2m])
 
 



