# docker-redis-cluster

docker build -t rediscluster .

docker run --name rediscluster --network host -v /tmp/redis_cluster/sup:/var/log/supervisor -v /tmp/redis_cluster/data:/redis-data -tid rediscluster
