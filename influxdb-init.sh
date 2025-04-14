#!/bin/bash
set -e

# Start InfluxDB in the background
echo "Starting InfluxDB in the background..."
influxdb3 serve \
    --node-id beach_banana \
    --object-store file \
    --data-dir /influxdb-data \
    --without-auth &
INFLUXDB_PID=$!

# Wait for InfluxDB to be ready
echo "Waiting for InfluxDB to start..."
while ! nc -z localhost 8181; do
  echo "Waiting for InfluxDB to become available..."
  sleep 1
done

echo "InfluxDB started, creating database: ${INFLUXDB_DATABASE}"
# Create the database
influxdb3 create database ${INFLUXDB_DATABASE}
echo "Database ${INFLUXDB_DATABASE} created successfully"

# Keep the container running by following the InfluxDB process
echo "Setup complete, following InfluxDB process"
wait $INFLUXDB_PID
