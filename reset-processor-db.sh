#!/usr/bin/env bash
set -e

source .env

docker-compose rm -vsf processor
docker-compose rm -vsf graphql-server
docker exec db psql -U postgres -c "DROP DATABASE ${PROCESSOR_DB_NAME};"

./up.sh
