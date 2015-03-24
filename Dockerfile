FROM thstangenberg/java-builder:8

MAINTAINER Thorben Stangenberg <thorben@stangenberg.ch>

# The version of nexus to install
ENV NEXUS_VERSION 2.11.2-03

RUN mkdir -p /opt/sonatype/nexus \
  && curl --fail --silent --location --retry 3 \
    https://download.sonatype.com/nexus/oss/nexus-${NEXUS_VERSION}-bundle.tar.gz \
  | gunzip \
  | tar x -C /tmp nexus-${NEXUS_VERSION} \
  && mv /tmp/nexus-${NEXUS_VERSION}/* /opt/sonatype/nexus/ \
  && rm -rf /tmp/nexus-${NEXUS_VERSION}

VOLUME /nexus-work

EXPOSE 9000

ENV MAX_HEAP 1g

ENV MIN_HEAP 256m

ENV JAVA_OPTS -server -Djava.net.preferIPv4Stack=true

ADD conf /opt/sonatype/nexus/conf

ADD nexus.run.sh /etc/service/nexus/run

RUN chmod 700 /etc/service/nexus/run

# Clean up when done.
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* \
           /tmp/* \
           /var/tmp/* 
