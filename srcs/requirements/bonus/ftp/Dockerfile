FROM debian:stable

RUN apt-get update && apt-get install -y vsftpd

COPY tools/launch_ftp_server.sh /launch_ftp_server.sh

RUN chmod +x /launch_ftp_server.sh

COPY conf /etc/vsftpd.conf

CMD ["./launch_ftp_server.sh"]
