FROM ubuntu:zesty

WORKDIR /source
USER root

RUN     apt-get -y update && \
        apt-get -y upgrade && \
        apt-get clean   &&\
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# dependencies
RUN     apt-get -y update && \
        apt-get -y install \
        git adduser libfontconfig wget make curl tcpdump pmacct unzip vim supervisor inetutils-ping dnsutils && \
        apt-get clean   &&\
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ARG TELEGRAF_VERSION=1.2.1

########################
### Install telegraf ###
########################

RUN     curl -s -o /tmp/telegraf_latest_amd64.deb https://dl.influxdata.com/telegraf/releases/telegraf_${TELEGRAF_VERSION}_amd64.deb && \
        dpkg -i /tmp/telegraf_latest_amd64.deb && \
        mkdir -p /opt/telegraf/config/ && \
        rm /tmp/telegraf_latest_amd64.deb

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN mkdir /data
ADD templates /data/templates/
WORKDIR /data

CMD ["/usr/bin/supervisord"]
