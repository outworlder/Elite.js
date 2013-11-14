FROM ubuntu

MAINTAINER Stephen Eilert "spedrosa@gmail.com"

RUN apt-get update
RUN apt-get install -y git-core
RUN apt-get install -y python-software-properties python g++ make
RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list
RUN add-apt-repository -y ppa:chris-lea/node.js && apt-get update
RUN apt-get install -y nodejs

RUN npm install -g grunt

VOLUME /Elite.js

EXPOSE 8000

# RUN git clone https://github.com/outworlder/Elite.js.git /Elite.js

WORKDIR /Elite.js
