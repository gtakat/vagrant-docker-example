FROM hotate/nginx

MAINTAINER hotate

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

#RUN dpkg-reconfigure -u

# Install apps
RUN apt-get update
RUN apt-get install -y php7.0 php7.0-fpm php7.0-mysql

RUN apt-get clean

# expose rails port
#EXPOSE 3000

#ADD init.sh /usr/local/bin/init.sh
#RUN chmod u+x /usr/local/bin/init.sh
#CMD ["/usr/local/bin/init.sh"]

