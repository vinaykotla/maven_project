FROM ubuntu:18.04
MAINTAINER Sanjay KB "sanjay.baberwal@sonetel.com"
RUN apt-get update -y && \
    apt-get install -y python3-pip && \
    apt-get install -y mongodb
WORKDIR /opt/biz
COPY . /opt/biz
RUN pip3 install -r /opt/biz/Requirements.txt
#COPY he.py /opt/biz
ENTRYPOINT [ "python3" ]
CMD [ "he.py" ]
EXPOSE 81

