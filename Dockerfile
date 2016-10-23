FROM ubuntu:14.04

RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62
RUN echo "deb http://nginx.org/packages/ubuntu/ trusty nginx" >> /etc/apt/sources.list
RUN echo "deb-src http://nginx.org/packages/mainline/ubuntu/ trusty nginx" >> /etc/apt/sources.list


RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get install -y supervisor
RUN apt-get install -y ca-certificates


COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80 443 8000

CMD ["/usr/bin/supervisord"]
