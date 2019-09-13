FROM alpine:3
LABEL MAINTAINER="kopwei <kopkop@gmail.com>"
ENV LANG C.UTF-8
RUN apk add --no-cache python
ADD http://apache.mirrors.spacedump.net/cassandra/3.0.18/apache-cassandra-3.0.18-bin.tar.gz /cassandra.tar.gz
WORKDIR /
RUN tar zxf /cassandra.tar.gz && mv /apache-cassandra* /cassandra && \
    rm -f /cassandra.tar.gz && rm -r /cassandra/doc /cassandra/javadoc /cassandra/conf /cassandra/interface
ENTRYPOINT [ "/cassandra/bin/cqlsh" ]