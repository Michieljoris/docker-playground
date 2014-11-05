FROM michieljoris/supervisor-debian
MAINTAINER Michiel van Oosten <mail@axion5.net>

COPY rcouch.tgz ./
RUN mkdir rcouch
RUN mv rcouch.tgz rcouch
RUN tar xf rcouch/rcouch.tgz

# Expose listen port
EXPOSE 5984

# Expose our data, logs and configuration volumes
VOLUME ["/rcouch/rel/rcouch/data", "/rcouch/rel/rcouch/log", "/rcouch/rel/rcouch/etc"]


COPY rcouch.conf /etc/supervisor/conf.d/rcouch.conf


