FROM debian:stable

RUN apt-get update && apt-get install -y nginx
RUN mkdir -p /var/www/simple_website
COPY index.html /var/www/simple_website
COPY conf /etc/nginx/nginx.conf

COPY tools/launch.sh /launch.sh

RUN chmod +x /launch.sh

CMD ["./launch.sh"]
