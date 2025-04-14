# Instructions to run InfluxDB and Grafana using docker in 2025

## Startup

```bash
# Set required environment variables
export PATH_IN_HOST_MACHINE=$HOME/Documents/influx-db-demo
mkdir -p ${PATH_IN_HOST_MACHINE}

# Set the database name (defaults to CityWeather if not specified)
export INFLUXDB_DATABASE=CityWeather

docker compose up -d
# Database is automatically created on container startup
```

Connect to the containers

```bash
docker exec -it influxdb /bin/bash

docker exec -it grafana /bin/bash
# Check connectivity from grafana to influxdb
nc -vz influxdb 8181
```

Default username and password for grafana is `admin`. (See <https://grafana.com/docs/grafana/latest/setup-grafana/sign-in-to-grafana/>)

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
