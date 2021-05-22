FROM ubuntu:20.04

WORKDIR /FilesDB

RUN chmod -R 777 /FilesDB

RUN apt -qq update

ENV TZ Asia/Dhaka
ENV DEBIAN_FRONTEND noninteractive

RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN ap -qq update

RUN apt -qq install -y python3.6 python3-pip

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

RUN useradd -ms /bin/bash unkusr
USER unkusr
CMD ./start.sh
