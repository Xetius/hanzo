# Hanzo demo pipeline

## Flask app
I straight up copied this from the internet to get a Python Flask container.

http://containertutorials.com/docker-compose/flask-simple-app.html

# Build container
Execute `make build` in the project root to build the container

# Kubernetes
This demo utilises Kubernetes for this demo.
Tested using Docker for Desktop on Mac with Kubernetes 1.15.5 enabled
Requires Helm 3 installed

# Install Jenkins
Install a local Jenkins instance by running `install-jenkins.sh`

Once installed, configure forwarding to this by running the following.
```
export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/component=jenkins-master" -l "app.kubernetes.io/instance=jenkins" -o jsonpath="{.items[0].metadata.name}")
kubectl --namespace default port-forward $POD_NAME 8080:8080 
```

Jenkins should now be accessible on `http://localhost:8080`

