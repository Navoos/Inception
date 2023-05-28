FROM debian:stable

RUN apt-get update && apt-get install -y redis-server
COPY tools/create_redis_server.sh /create_redis_server.sh
RUN chmod +x /create_redis_server.sh
RUN mkdir -p /etc/redis
COPY conf /etc/redis/redis.conf

CMD ["/create_redis_server.sh"]
