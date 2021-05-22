FROM ubuntu:20.04

WORKDIR /FilesDB

RUN chmod -R 777 /FilesDB

RUN apt -qq update

ENV TZ Asia/Dhaka
ENV DEBIAN_FRONTEND noninteractive

RUN apt -qq install -y python3 python3-pip

RUN apt-get install -y software-properties-common
RUN apt-get -y update

RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN apt install -y python3.6

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

RUN chmod 777 start.sh

RUN useradd -ms /bin/bash unkusr
USER unkusr
RUN python3 --version
CMD ./start.sh
