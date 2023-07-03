## HowTo run a Joystream QueryNode instance with docker compose

All you need to start a joystream-node and query node for the Joystream mainnet, is in this repo.

### Steps

```sh
git clone https://github.com/mnaamani/query-node-standalone && cd query-node-standalone/
cp env.example .env
# edit .env file to customise database volume, chain database paths and websocket rpc endpoint.

# Start the chain. You can skip this step if you use a remote rpc endpoint.
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

A working graphql endpoint should be accessible at http://localhost:8081/

You should wait for nodes to fully sync up before using it in production.
