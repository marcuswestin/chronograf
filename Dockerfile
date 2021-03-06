FROM gliderlabs/alpine
MAINTAINER Chris Goller <chris@influxdb.com>

RUN apk add --update ca-certificates && \
    rm /var/cache/apk/*
RUN mkdir -p /var/lib/chronograf

ADD chronograf /usr/bin/chronograf
ADD canned/*.json /usr/share/chronograf/canned/
ADD LICENSE /usr/share/chronograf/LICENSE
ADD agpl-3.0.md /usr/share/chronograf/agpl-3.0.md

EXPOSE 8888

CMD ["/usr/bin/chronograf", "-b", "/var/lib/chronograf/chronograf-v1.db", "-c", "/usr/share/chronograf/canned"]
