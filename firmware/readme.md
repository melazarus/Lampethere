# Dev setup

## Setup an MQTT broker

Pull the Mosquitto image: `docker pull eclipse-mosquitto`  
Start the broker (no volume mounted so nothing is persisted): `docker run --rm -it -p 1883:1883 -p 9001:9001 -v .dockerBroker:/mosquitto/config eclipse-mosquitto`  
Preset passwords (DO NOT USE THESE):

- master: 2KcqjFkJ37UseE8F
- client: nusE5v5Am584pSeT

## Packages

[WifiManager](https://github.com/tzapu/WiFiManager): v 2.0.3-alpha
