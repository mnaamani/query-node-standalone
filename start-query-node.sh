#!/usr/bin/env bash
set -e

# Bring up db service
docker compose up -d db
# This is an alternative to the init.sh script
# Initialize the processor database
docker compose up db-init

# Start indexer and gateway
docker compose up -d indexer
docker compose up -d hydra-indexer-gateway

# Start processor and graphql server
docker compose up -d processor
docker compose up -d graphql-server

