FROM stangenberg/java:latest

MAINTAINER Thorben Stangenberg <thorben@stangenberg.ch>

# The version of nexus to install
ENV NEXUS_VERSION 2.11.4-01

RUN mkdir -p /opt/sonatype/nexus \
  && curl --fail --silent --location --retry 3 \
    https://download.sonatype.com/nexus/oss/nexus-${NEXUS_VERSION}-bundle.tar.gz \
  | gunzip \
  | tar x -C /tmp nexus-${NEXUS_VERSION} \
  && mv /tmp/nexus-${NEXUS_VERSION}/* /opt/sonatype/nexus/ \
  && rm -rf /tmp/nexus-${NEXUS_VERSION}

VOLUME /nexus-work

EXPOSE 9000

ENV JAVA_OPTS -Xms256m -Xmx1g -Djava.awt.headless=true -server -Djava.net.preferIPv4Stack=true

# Use environment variables to override the default configuration
ENV NEXUS_APPLICATION_HOST 0.0.0.0
ENV NEXUS_APPLICATION_PORT 9000
ENV NEXUS_WORK /nexus-work
ENV NEXUS_CONTEXT_PATH /

RUN rm -rf /opt/sonatype/nexus/conf

ADD conf /opt/sonatype/nexus/conf

ADD nexus.run.sh /etc/service/nexus/run

RUN chmod 700 /etc/service/nexus/run

# Clean up when done.
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* \
           /tmp/* \
           /var/tmp/*
