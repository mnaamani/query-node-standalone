## Howto Run Joystream QueryNode with docker-compose

All you need is in the repo, to start a joystream-node and query node for the Joystream mainnet.

```
git clone https://github.com/mnaamani/query-node-standalone
cd query-node-standalone/
cp env.example to .env
# edit .env file to customise database volume path and chain database path and websocket rpc endpoint for fetching blocks.

# If you are not using a custom value for JOYSTREAM_NODE_WS in .env file, you need to run a local joystream-node service.
docker-compose up -d joystream-node

# Initialize the query-node database
./init.sh

# Bring up the query-node services
./up.sh
```

A working graphql endpoint should be accessible at http://localhost:8081/

You should wait for node to fully sync up before using it in production.
