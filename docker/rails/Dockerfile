FROM hotate/nginx

MAINTAINER hotate

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# Install apps
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:brightbox/ruby-ng
RUN apt-get update
RUN apt-get install -y ruby2.3
RUN apt-get install -y build-essential patch
RUN apt-get install -y ruby2.3-dev zlib1g-dev
RUN apt-get install -y nodejs
RUN apt-get install -y libmysqlclient-dev
RUN gem install rails

RUN apt-get clean

# expose rails port
EXPOSE 3000

#ADD init.sh /usr/local/bin/init.sh
#RUN chmod u+x /usr/local/bin/init.sh
#CMD ["/usr/local/bin/init.sh"]

