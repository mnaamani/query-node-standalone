## HowTo run a Joystream QueryNode instance with docker compose

All you need to start a joystream-node and query node for the Joystream mainnet, is in this repo.

### Full Independant Setup
Use this setup to run a setup with no dependencies on any external services.

```sh
git clone https://github.com/mnaamani/query-node-standalone && cd query-node-standalone/
cp env.example .env
# edit .env file to customise database volume, chain database paths

# Start the chain.
docker compose up -d joystream-node
# Bring up db service
docker compose up -d db
# Initialize the processor database
docker compose up db-init
# Start indexer and gateway
docker compose up -d indexer
docker compose up -d hydra-indexer-gateway
# Start processor and graphql server
docker compose up -d processor
docker compose up -d graphql-server
```

A working graphql endpoint should be accessible at http://localhost:8081/graphql

You should wait for nodes to fully sync up before using it in production.

### Processor Only
The slowest component in the query-node stack at the moment is indexing and it can take several hours to sync up. Its possible to use an external indexer that is already synced with the chain.

in this setup, you will not need to run a joystream-node or indexer, simply a processor and graphql-server.

There are some public indexer endpoints that can be used. (mainnet-rpc-1.joystream.org, mainnet-rpc-2.joystream.org, mainnet-rpc-3.joystream.org) by setting `PROCESSOR_INDEXER_GATEWAY` in your `.env` file.

```sh
git clone https://github.com/mnaamani/query-node-standalone && cd query-node-standalone/
cp env.example .env
# Edit the .env file:
# to customise database volume, chain database paths
# and set the `PROCESSOR_INDEXER_GATEWAY` value for example:
# PROCESSOR_INDEXER_GATEWAY=https://mainnet-rpc-1.joystream.org/query-node/indexer/graphql

# Bring up db service
docker compose up -d db
# Initialize the processor database
docker compose up db-init
# Start processor and graphql server
docker compose up -d processor
docker compose up -d graphql-server
```
