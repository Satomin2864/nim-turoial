FROM nimlang/nim:latest
MAINTAINER satomin.stmn

RUN apt-get update && apt-get install -y vim curl

RUN nimble -y install jester

WORKDIR /opt/nim_jester