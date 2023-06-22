FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y apache2 apt-mirror reprepro

# COPY mirror.list /etc/apt/
COPY distributions /var/www/html/ubuntu/conf/
COPY entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

EXPOSE 80

ENTRYPOINT ["entrypoint.sh"]
