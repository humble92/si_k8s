doctl auth init
docker build -t my-python-app .
docker buildx build --platform=linux/amd64 -t my-python-app .


shareninspireflask
doctl registry create shareninspireflask
docker tag my-python-app registry.digitalocean.com/shareninspireflask/my-python-app
docker push registry.digitalocean.com/shareninspireflask/my-python-app
docker run -p 80:80 registry.digitalocean.com/shareninspireflask/my-python-app

doctl registry create <your-registry-name>
doctl registry login
docker tag my-python-app registry.digitalocean.com/<your-registry-name>/my-python-app
docker push registry.digitalocean.com/<your-registry-name>/my-python-app
docker run -p 80:80 registry.digitalocean.com/<your-registry-name>/my-python-app


doctl kubernetes cluster create flask-app --tag do-tutorial --auto-upgrade=true --node-pool "name=mypool;count=2;auto-scale=true;min-nodes=1;max-nodes=3;tag=do-tutorial"

kubectl get deployments
kubectl get pods
kubectl get service flask
kubectl describe secret postgres-credentials
kubectl describe pvc postgres-pvc

kubectl delete pvc postgres-pvc
kubectl delete pv postgres-pv

# view storage class
kubectl get sc

kubectl exec -it postgres-7d8659d485-xg2zm -- /bin/bash


# ------------------------------

# Prepare docker
create flask app
create dockerfile

doctl auth init
doctl registry login
docker build -t my-python-app .
docker buildx build --platform=linux/amd64 -t my-python-app .
docker tag my-python-app registry.digitalocean.com/<your-registry-name>/my-python-app
docker tag my-python-app registry.digitalocean.com/<your-registry-name>/my-python-app

docker push registry.digitalocean.com/<your-registry-name>/my-python-app
docker run -p 80:80 registry.digitalocean.com/<your-registry-name>/my-python-app
-----------------------------
# Prepare web app deployment
doctl kubernetes cluster create flask-app-yaml --tag do-tutorial --auto-upgrade=true --node-pool "name=mypool;count=2;auto-scale=true;min-nodes=1;max-nodes=3;tag=do-tutorial"
kubectl create -f deployment.yaml
kubectl get deployments
kubectl get pods
kubectl logs flask-747f897874-467wh
-----------------------------
# Prepare web app service
kubectl create -f service.yaml
kubectl get service flask
external-ip 
-----------------------------
# Prepare secret for postgres
set up secret
kubectl apply -f secret.yaml
kubectl describe secret postgres-credentials
-----------------------------
# Prepare volumne for postgres
kubectl apply -f volume-claim.yaml
kubectl get pvc
kubectl get pv
-----------------------------
# Prepare postgres
kubectl create -f postgres-deployment.yaml
kubectl get deployments
kubectl get pods
kubectl create -f postgres-service.yaml
kubectl get service flask postgres

kubectl exec <POD_NAME> --stdin --tty -- createdb -U <USER_NAME> todo
kubectl exec postgres-7d8659d485-xg2zm --stdin --tty -- createdb -U jonghyeok todo
-----------------------------
kubectl delete -f deployment.yaml
kubectl create -f updated-deployment.yaml
kubectl get service
-----------------------------
check the website



# flask app deployment (git sharing) 
# Dockerfile
# Registry 

kubectl cluster-info
kubectl config get-contexts
kubectl config use-context <context-name>

doctl kubernetes cluster create airflow-app --tag do-airflow-tutorial --auto-upgrade=true --node-pool "name=mypool;count=2;auto-scale=true;min-nodes=1;max-nodes=3;tag=do-airflow-tutorial"


# installing helm
cd /tmp
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod u+x get_helm.sh
./get_helm.sh


kubectl create namespace airflow
kubectl get namespace

helm repo add apache-airflow https://airflow.apache.org
helm repo list

helm upgrade --install airflow apache-airflow/airflow -n airflow --debug

helm show values apache-airflow/airflow > values.yaml
helm upgrade --install airflow apache-airflow/airflow -n airflow  \
  -f values.yaml \
  --debug