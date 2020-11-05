## Howto setup


## Development environmnet cluster setup
Install or configure a Kubernetes environment of choice.
An example for running local development is configuring a __microk8s__ instance.
Instructions on installing microk8s
https://microk8s.io/


Due to recent changes in microk8s it needs to change the default container runtime to be compatible with argo workflows.
in the 
```bash
/var/snap/microk8s/current/args/kubelet
```
change the argument --container-runtime from remote to docker
and disable the extra --container-runtime-arguments by beginning the line with `#`.


## Services setup

### Minio service
```bash
$ helm repo add minio https://helm.min.io/
```

```bash
$ helm install --set accessKey=myaccesskey,secretKey=mysecretkey --generate-name minio/minio
```
More information can be found here.  https://github.com/minio/charts
__Setup an ingress__
> Modify the resource under `config/minio-ingress.yaml` according to your installation to expose a service outside the cluster.

### Argo server
Install argo

```bash
kubectl create ns argo
kubectl apply -n argo -f https://raw.githubusercontent.com/argoproj/argo/stable/manifests/quick-start-postgres.yaml
```

Gain access to the service by port forwarding:
```bash
kubectl -n argo port-forward deployment/argo-server 2746:2746
```


__Setup an ingress__
> Modify the resource under `config/argo-ingress.yaml` according to your installation to expose a service outside the cluster.


