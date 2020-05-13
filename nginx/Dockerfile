FROM nginx:latest
MAINTAINER satomin.stmn

ADD ./server.conf /etc/nginx/conf.d/defalut.conf

RUN apt-get update && apt-get install -y vim curl

WORKDIR /opt/nim_server