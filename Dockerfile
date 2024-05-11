FROM centos:7

ARG user=class3

WORKDIR /var/www/html

LABEL maintainer=Pandian
LABEL vendor=A2ZCS
LABEL Env=Dev

ENV WEB little-fashion.zip
ENV FASHION 2127_little_fashion

RUN yum install httpd unzip wget -y

COPY $WEB .

RUN unzip $WEB && mv ./$FASHION/*  .

RUN rm -rf $WEB $FASHION

RUN useradd $user && chown $user:$user -R .

USER root

COPY 1.sh /.

RUN chmod +x /1.sh

CMD /1.sh
             
