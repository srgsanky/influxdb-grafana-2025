FROM quay.io/influxdb/influxdb3-core:latest

# Install nc
USER root
RUN apt update && apt install -y netcat-openbsd

USER influxdb3
