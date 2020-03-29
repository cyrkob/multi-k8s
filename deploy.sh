docker build -t cyran/multi-client:latest -t cyran/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t cyran/multi-server:latest -t cyran/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t cyran/mutli-worker:latest -t cyran/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push cyran/multi-client:latest
docker push cyran/multi-server:latest
docker push cyran/multi-worker:latest

docker push cyran/multi-client:$SHA
docker push cyran/multi-server:$SHA
docker push cyran/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=cyran/multi-server:$SHA
kubectl set image deployments/client-deployment client=cyran/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=cyran/multi-worker:$SHA
