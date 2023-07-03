#!/usr/bin/env bash
set -e

# Sourcing some configure from .env the WARTHOG_* variables to match the .env settings
# we don't configure them in the .env because they clash with settings for hydra-indexer-gateway
source .env

# Bring up db service
docker compose up -d db

# Migrate the processor db
docker compose run \
  -e WARTHOG_DB_HOST=db \
  -e WARTHOG_DB_DATABASE=${PROCESSOR_DB_NAME} \
  -e WARTHOG_DB_USERNAME=${DB_USER} \
  -e WARTHOG_DB_PASSWORD=${DB_PASS} \
  -e WARTHOG_DB_PORT=${DB_PORT} \
  --rm --entrypoint sh graphql-server \
  -c "yarn workspace query-node-root db:prepare && yarn workspace query-node-root db:migrate"
