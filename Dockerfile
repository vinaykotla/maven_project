#Download base image ubuntu 16.04
FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y python3-pip mongodb 
RUN python3 ./test.py

