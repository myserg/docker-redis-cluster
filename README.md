# docker-redis-cluster

docker build -t rediscluster .

docker run --network host -v /tmp/rec/sup:/var/log/supervisor -v /tmp/rec/data:/redis-data -d -ti rediscluster
