FROM hotate/nginx

MAINTAINER hotate

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# Install apps
RUN apt-get install -y ruby-rails-4.0

RUN apt-get clean

# expose nginx port
#EXPOSE 22 80

#ADD init.sh /usr/local/bin/init.sh
#RUN chmod u+x /usr/local/bin/init.sh
#CMD ["/usr/local/bin/init.sh"]

