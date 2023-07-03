## Howto Run Joystream QueryNode with docker-compose

```
git clone https://github.com/mnaamani/query-node-standalone
cd query-node-standalone/
cp env.example to .env
# edit .env file to customise database volume path and RPC endpoint to fetch blocks

# initialize the database
./init.sh
# start services
./up.sh
```

### Deploy to K8s cluster
https://kubernetes.io/docs/tasks/configure-pod-container/translate-compose-kubernetes/

### Deploy to Nomard cluster
https://github.com/uchenic/compose-to-nomad/tree/master
