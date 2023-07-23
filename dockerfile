FROM ubuntu:latest

RUN apt-get update && \
    apt-get upgrade -y 

RUN apt-get install curl jq iputils-ping -y 

RUN curl -sSL https://github.com/peak/s5cmd/releases/download/v2.1.0/s5cmd_2.1.0_Linux-64bit.tar.gz | \
    tar -zx && \
    chmod +x s5cmd && \
    mv s5cmd /usr/local/bin


ENTRYPOINT [ "/bin/bash" ]