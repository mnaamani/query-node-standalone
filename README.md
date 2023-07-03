## Howto Run Joystream QueryNode with docker-compose

cp env.example to .env
edit .env
edit docker-compose.yml to change volume directory for database as needed.
./init.sh
./start.sh

## Caddy Setup/nginx ?

### Deploy to K8s cluster
https://kubernetes.io/docs/tasks/configure-pod-container/translate-compose-kubernetes/

### Deploy to Nomard cluster
https://github.com/uchenic/compose-to-nomad/tree/master
