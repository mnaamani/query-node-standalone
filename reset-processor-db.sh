#!/usr/bin/env bash
set -e

source .env

docker compose rm -vsf processor
docker compose rm -vsf graphql-server

# drop the processor database
docker exec db psql -U postgres -c "DROP DATABASE ${PROCESSOR_DB_NAME};"

# Start processor and graphql server
docker compose up -d processor
docker compose up -d graphql-server
