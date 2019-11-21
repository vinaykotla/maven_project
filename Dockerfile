#Download base image ubuntu 16.04
FROM ubuntu:16.04
#RUN apt-get update
#RUN apt-get install -y python3-pip mongodb 
RUN pwd
WORKDIR /opt/biz
RUN ls -l /opt/biz
RUN python3 /opt/biz/test.py

