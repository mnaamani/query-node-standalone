## Joystream QueryNode instance with docker compose

All you need to start a joystream-node and query node for the Joystream mainnet, is in this repo.

### Full Independant Configuration
Use this setup to run with no dependencies on any external services.

```sh
git clone https://github.com/mnaamani/query-node-standalone && cd query-node-standalone/
cp env.example .env
# edit .env file to customise database volume, username, password and chain database paths.

# Start all services
docker compose up -d
```

A working graphql endpoint should be accessible at http://localhost:8081/graphql

You should wait for nodes to fully sync up before using it in production.

### Processor Only Configuration
The slowest component in the query-node stack at the moment is indexing and it can take several hours to sync up. Its possible to use an external indexer that is already synced with the chain.

In this setup, you will not run a joystream-node or indexer/gatewat, just the database, processor and graphql-server.

There are some public indexer endpoints that can be used. (mainnet-rpc-1.joystream.org, mainnet-rpc-2.joystream.org, mainnet-rpc-3.joystream.org) by setting `PROCESSOR_INDEXER_GATEWAY` in your `.env` file.

```sh
git clone https://github.com/mnaamani/query-node-standalone && cd query-node-standalone/
cp env.example .env
# Edit the .env file:
# customise database volume, username, password
# and set the `PROCESSOR_INDEXER_GATEWAY` value for example:
# PROCESSOR_INDEXER_GATEWAY=https://mainnet-rpc-1.joystream.org/query-node/indexer/graphql

docker compose up -d graphql-server
```
