FROM ubuntu:14.04
MAINTAINER Michiel van  Oosten <mail@axion5.net>

# libs
RUN apt-get update 
RUN apt-get install -y build-essential \
checkinstall \
git \
curl \
zip \
libicu-dev \
libcurl4-openssl-dev \
libwxbase2.8-0 \
gcj-4.8-jre \
gcj-4.8-jre-headless \
libwxgtk2.8-0

RUN apt-get install -y libmozjs185-dev

#erlang
COPY esl-erlang_15.b~ubuntu~oneiric_amd64.deb  ./
RUN dpkg -i esl-erlang_15.b~ubuntu~oneiric_amd64.deb

#rebar
RUN git clone git://github.com/rebar/rebar.git 
WORKDIR /rebar
RUN ls && ./bootstrap && cp rebar /bin

#rcouch
WORKDIR /
RUN git clone https://github.com/rcouch/rcouch.git
WORKDIR /rcouch
RUN make 


# RUN  apt-get install -y help2man \
# python-sphinx
 # texlive-latex-base \
 # texlive-latex-recommended \
 # texlive-latex-extra \
 # texlive-fonts-recommended \
 # texinfo \
 # gnupg
# RUN make rel
RUN make rel icu=static
# RUN make rel USE_STATIC_ICU=1

# RUN make html
# RUN make reldoc

# Expose listen port
# EXPOSE 5984

# Expose our data, logs and configuration volumes
# VOLUME ["/rcouch/rel/rcouch/data", "/rcouch/rel/rcouch/log", "/rcouch/rel/rcouch/etc"]

# ---------------------------------------------------------------------
# cleanup

# RUN apt-get purge  -y \
# build-essential \
# checkinstall \
# git \
# curl \
# zip \
# libicu-dev \
# libcurl4-openssl-dev \
# && apt-get autoremove -y 

# RUN rm /esl-erlang_15.b~ubuntu~oneiric_amd64.deb 

# COPY rcouch.conf /etc/supervisor/conf.d/rcouch.conf

RUN tar czf rcouch-stock.tgz rel

# RUN apt-get update && apt-get install -y libicu52 --no-install-recommends \
# && rm -rf /var/lib/apt/lists/* \
# && rm -rf /tmp/rcouch

# ----------------------------------------


# RUN useradd -d /var/lib/rcouch rcouch

# RUN mkdir -p /var/log/supervisor
# RUN locale-gen en_US en_US.UTF-8
# COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf


# WORKDIR /

# WORKDIR /rcouch/rel/rcouch


# gcj-4.8-jre \
# gcj-4.8-jre-headless
# libwxbase2.8-0 \

# COPY script.sh  ./
# RUN pwd
# RUN chmod +x script.sh
# CMD ./script.sh && tail -F /rcouch/rel/rcouch/log/couch.log
