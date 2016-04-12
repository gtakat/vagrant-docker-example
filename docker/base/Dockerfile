FROM ubuntu:trusty

MAINTAINER hotate

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# Avoid ERROR: invoke-rc.d: policy-rc.d denied execution of start.
RUN echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d
RUN apt-get update && apt-get upgrade -y
