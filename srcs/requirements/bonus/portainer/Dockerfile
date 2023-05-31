FROM debian:stable

RUN apt-get update && apt-get install -y wget

COPY tools/launch.sh /launch.sh

RUN chmod +x /launch.sh

CMD ["./launch.sh"]
