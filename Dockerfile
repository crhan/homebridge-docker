FROM nodesource/jessie:5.8.0
MAINTAINER Christian Brandlehner <christian@brandlehner.at>

##################################################
# Set environment variables                      #
##################################################

# Ensure UTF-8
#ENV LANGUAGE=en_US.UTF-8
# ENV LANG en_US.UTF-8
#ENV LANG=C
#ENV LC_ALL en_US.UTF-8

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

##################################################
# Install tools                                  #
##################################################

RUN apt-get update
RUN apt-get install -y apt-utils 
RUN apt-get install -y apt-transport-https
RUN apt-get install -y locales
#RUN locale-gen en_US.UTF-8
RUN apt-get install -y curl wget git python build-essential make g++ libavahi-compat-libdnssd-dev libkrb5-dev vim net-tools nano
RUN alias ll='ls -alG'

##################################################
# Install homebridge                             #
##################################################

RUN npm install -g homebridge --unsafe-perm

# depending on your config.json you have to add your modules here!
RUN npm install -g homebridge-philipshue --unsafe-perm
RUN npm install -g homebridge-ninjablock-temperature --unsafe-perm
RUN npm install -g homebridge-ninjablock-humidity --unsafe-perm
RUN npm install -g homebridge-ninjablock-alarmstatedevice --unsafe-perm
RUN npm install -g homebridge-luxtronik2 --unsafe-perm
#RUN npm install -g homebridge-mqttswitch --unsafe-perm
#RUN npm install -g homebridge-edomoticz --unsafe-perm

##################################################
# Start                                          #
##################################################

USER root
RUN mkdir -p /var/run/dbus

# ADD config-sample/package.json /root/.homebridge/package.json
ADD image/run.sh /root/run.sh

EXPOSE 5353 51826
CMD ["/root/run.sh"]
