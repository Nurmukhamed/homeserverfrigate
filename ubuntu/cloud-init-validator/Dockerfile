FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -qq -y update &&\
    apt-get -qq -y install cloud-init less

WORKDIR /app

ENTRYPOINT ["cloud-init"]

CMD ["schema", "-c", "user-data", "--annotate"]
