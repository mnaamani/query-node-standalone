#!/usr/bin/env bash
set -e

# Bring up db service
docker-compose up -d db

# Start indexer and gateway
docker-compose up -d indexer
docker-compose up -d hydra-indexer-gateway

# Start processor and graphql server
docker-compose up -d processor
docker-compose up -d graphql-server

