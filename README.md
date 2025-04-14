# Instructions to run InfluxDB and Grafana using docker in 2025

## Startup

```bash
export PATH_IN_HOST_MACHINE=$HOME/Documents/influx-db-demo
mkdir -p ${PATH_IN_HOST_MACHINE}
docker compose up -d
docker exec -it influxdb influxdb3 create database CityWeather
```

Connect to the containers

```bash
docker exec -it influxdb /bin/bash

docker exec -it grafana /bin/bash
# Check connectivity from grafana to influxdb
nc -vz influxdb 8181
```

Default username and password for grafana is `admin`.

## Shutdown

```bash
docker compose down
```

## Check logs

```bash
docker compose logs
docker compose logs -f influxdb
docker compose logs -f grafana
```

