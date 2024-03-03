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

kubectl exec <POD_NAME> --stdin --tty -- createdb -U <USER_NAME> products
kubectl exec postgres-7d8659d485-ktsqt --stdin --tty -- createdb -U jonghyeok products
-----------------------------
kubectl delete -f deployment.yaml
kubectl create -f updated-deployment.yaml
kubectl get service
-----------------------------
check the website
