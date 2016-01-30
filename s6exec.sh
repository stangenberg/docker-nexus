#!/usr/bin/env sh

chown -hR app /nexus-work \
&& exec s6-applyuidgid -u 999 -g 999 /opt/sonatype/nexus/run.sh
