#!/bin/bash

source config.sh

# using configuration values stored in the config.sh file
# after sourcing through the source command:  source config.sh

echo "Database host: $DB_HOST"
echo "Database port: $DB_PORT"
echo "Database user name: $DB_USERNAME"
echo "Database password: $DB_PASSWORD"
