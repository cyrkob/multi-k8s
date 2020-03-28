docker build -t cyran/multi-client -f ./client/Dockerfile ./client
docker build -t cyran/multi-server -f ./server/Dockerfile ./server
docker build -t cyran/mutli-worker -f ./worker/Dockerfile ./worker
docker push cyran/multi-client
docker push cyran/multi-server
docker push cyran/multi-worker
kubectl apply -f k8s
