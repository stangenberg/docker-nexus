#!/bin/bash
# runs the nexus

cd /opt/sonatype/nexus && exec java \
  -Xms${MIN_HEAP} -Xmx${MAX_HEAP} \
  ${JAVA_OPTS} \
  -cp conf/:`(echo lib/*.jar) | sed -e "s/ /:/g"` \
  org.sonatype.nexus.bootstrap.Launcher conf/jetty.xml conf/jetty-requestlog.xml