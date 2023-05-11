#!/bin/bash

set -e

# Convert the password file.
mosquitto_passwd -b /mosquitto/config/passwd mosquitto mosquitto

exec "$@"
