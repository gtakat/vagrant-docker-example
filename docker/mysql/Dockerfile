FROM hotate/base

MAINTAINER hotate

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# Install apps
RUN apt-get install -y mysql-server

RUN apt-get clean

RUN sed -i -e"s/^bind-address.*=.*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# expose nginx port
EXPOSE 22 3306

#CMD ["echo", "running!"]
ADD init.sh /usr/local/bin/init.sh
RUN chmod u+x /usr/local/bin/init.sh
CMD ["/usr/local/bin/init.sh"]

