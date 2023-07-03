## Howto Run Joystream QueryNode with docker-compose

```
cp env.example to .env
# customise config:
# edit .env
# edit docker-compose.yml
# initialize the database
./init.sh
# start services
./up.sh
```

### Deploy to K8s cluster
https://kubernetes.io/docs/tasks/configure-pod-container/translate-compose-kubernetes/

### Deploy to Nomard cluster
https://github.com/uchenic/compose-to-nomad/tree/master
