FROM ubuntu:22.04

WORKDIR /mt-proto

RUN apt update && apt install -y \
  git make build-essential libssl-dev zlib1g-dev dnsutils

COPY .git/ .git
COPY common/ common/
COPY crypto/ crypto/
COPY engine/ engine/
COPY jobs/ jobs/
COPY mtproto/ mtproto/
COPY net/ net/ 
COPY vv/ vv/
COPY Makefile Makefile
COPY entrypoint.sh entrypoint.sh

RUN make -j 2

ENTRYPOINT [ "./entrypoint.sh" ]
