FROM hotate/base

MAINTAINER hotate

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# Install apps
RUN apt-get install -y curl
RUN touch /etc/apt/sources.list.d/nginx.list
RUN echo "deb http://nginx.org/packages/ubuntu/ trusty nginx" >> /etc/apt/sources.list.d/nginx.list
RUN echo "deb-src http://nginx.org/packages/ubuntu/ trusty nginx" >> /etc/apt/sources.list.d/nginx.list
RUN curl http://nginx.org/keys/nginx_signing.key | apt-key add -
RUN apt-get update && apt-get install -y nginx
RUN /usr/bin/apt-get install mysql-client -y

RUN apt-get clean

# expose nginx port
EXPOSE 22 80

#CMD ["echo", "running!"]
#CMD ["/etc/init.d/nginx", "start"]
ADD init.sh /usr/local/bin/init.sh
RUN chmod u+x /usr/local/bin/init.sh
CMD ["/usr/local/bin/init.sh"]

