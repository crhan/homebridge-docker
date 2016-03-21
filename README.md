[![Docker Stars](https://img.shields.io/docker/stars/cbrandlehner/homebridge.svg)](https://hub.docker.com/r/cbrandlehner/homebridge/)
[![Docker Pulls](https://img.shields.io/docker/pulls/cbrandlehner/homebridge.svg)](https://hub.docker.com/r/cbrandlehner/homebridge/)
[![GitHub forks](https://img.shields.io/github/forks/cbrandlehner/homebridge-docker.svg?style=social&label=Fork)](https://github.com/cbrandlehner/homebridge-docker)
# Homebridge-Docker

Docker image for Homebrigde

For details see https://github.com/nfarina/homebridge

This is simply wrapping the source in a runnable Docker image for everyone that cannot install the dev environment on his machine or everyone that wants a simple containerized solution.

## Supported plugins
homebridge-philipshue
homebridge-ninjablock-temperature
homebridge-ninjablock-humidity
homebridge-ninjablock-alarmstatedevice
homebridge-luxtronik2
homebridge-mqttswitch
homebridge-edomoticz
homebridge-synology

## Configuration

Copy `config-sample.json` to `config.json` and adapt to your likings.

## Build

`./homebridge.sh build`

## Run

### run first time

`./homebridge.sh run`

### stop

`./homebridge.sh stop`

### start

(after stopping)

`./homebridge.sh start`

### remove

(needed before run is possible again)

`./homebridge.sh remove`

### rerun

Stops and removes the containers, then performs run again

`./homebridge.sh rerun`

### attach

Attaches to the running container

`./homebridge.sh attach`

### logs

Diplays stdout log of the running container

`./homebridge.sh logs`

## Changelog
###0.11
moved from nodesource/jessie:5.6.0 to nodesource/jessie:5.8.0
moved files that are copied into the image are in directory ./image
moved configuration samtes to ./config-sample
simplified Dockerfile and combined the previously two script files into a single script
implemented a way to install homebridge modules at runtime without the need to include them in the docker image
fixing a locale issue with C vs UTF-8
