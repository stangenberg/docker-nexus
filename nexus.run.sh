#!/bin/bash
# runs the nexus

cd /opt/sonatype/nexus && exec java \
  ${JAVA_OPTS} \
  -cp conf/:`(echo lib/*.jar) | sed -e "s/ /:/g"` \
  org.sonatype.nexus.bootstrap.Launcher conf/jetty.xml conf/jetty-requestlog.xml
