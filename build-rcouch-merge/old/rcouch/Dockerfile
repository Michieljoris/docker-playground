FROM ubuntu:14.04
MAINTAINER Michiel van Oosten <mail@axion5.net>

RUN apt-get update && apt-get install -y \
build-essential \
checkinstall \
git \
curl \
zip \
libicu-dev \
libcurl4-openssl-dev

RUN apt-get install -y \
libwxbase2.8-0 \
gcj-4.8-jre \
gcj-4.8-jre-headless

RUN apt-get install -y \
libwxgtk2.8-0

COPY esl-erlang_15.b~ubuntu~oneiric_amd64.deb  ./
RUN dpkg -i esl-erlang_15.b~ubuntu~oneiric_amd64.deb

RUN git clone git://github.com/rebar/rebar.git
WORKDIR /rebar
RUN ls
RUN ./bootstrap
RUN cp rebar /bin

WORKDIR /
RUN git clone https://github.com/rcouch/rcouch.git
WORKDIR /rcouch
RUN make

# RUN  apt-# get install -y help2man \
    # python-sphinx \
    #  texlive-latex-base \
    #  texlive-latex-recommended \
    #  texlive-latex-extra \
    #  texlive-fonts-recommended \
    #  texinfo \
    #  gnupg
# RUN make reldoc
RUN make rel



RUN apt-get purge  -y \
build-essential \
checkinstall \
git \
curl \
zip \
libicu-dev \
libcurl4-openssl-dev \
&& apt-get autoremove -y 

# RUN apt-get update && apt-get install -y libicu52 --no-install-recommends \
# && rm -rf /var/lib/apt/lists/* \
# && rm -rf /tmp/rcouch

# ----------------------------------------


RUN useradd -d /var/lib/couchdb couchdb

RUN mkdir -p /var/log/supervisor
RUN locale-gen en_US en_US.UTF-8
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose listen port
EXPOSE 5984

# Expose our data, logs and configuration volumes
VOLUME ["/rcouch/rel/rcouch/data", "/rcouch/rel/rcouch/log", "/rcouch/rel/rcouch/etc"]

WORKDIR /

WORKDIR /rcouch/rel/rcouch


# gcj-4.8-jre \
# gcj-4.8-jre-headless
# libwxbase2.8-0 \




CMD ["/usr/bin/supervisord"]

# COPY script.sh  ./
# RUN pwd
# RUN chmod +x script.sh
# CMD ./script.sh && tail -F /rcouch/rel/rcouch/log/couch.log
