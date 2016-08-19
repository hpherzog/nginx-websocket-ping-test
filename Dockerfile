
FROM debian:jessie
MAINTAINER Hans-Peter Herzog <h-p.herzog@web.de>

RUN apt-get update && apt-get install -y \
nginx-full \
wget \
vim \
nano

RUN wget https://raw.githubusercontent.com/nodesource/distributions/master/deb/setup_4.x
RUN chmod +x setup_4.x
RUN ./setup_4.x
RUN apt-get update && apt-get install -y nodejs

COPY cfg/nginx/nwpt /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/nwpt /etc/nginx/sites-enabled/nwpt
RUN rm /etc/nginx/sites-enabled/default
RUN /etc/init.d/nginx restart

RUN mkdir -p /opt/nwpt

EXPOSE 80 443 8080 8443
