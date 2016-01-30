# Docker Nexus
A docker container featuring the [sonatype nexus](http://www.sonatype.org/nexus/) repository server.

[![Docker Stars](https://img.shields.io/docker/stars/stangenberg/nexus.svg)][dockerhub] [![Docker Pulls](https://img.shields.io/docker/pulls/stangenberg/nexus.svg)][dockerhub] [![Image Size](https://img.shields.io/imagelayers/image-size/stangenberg/nexus/latest.svg)](https://imagelayers.io/?images=stangenberg/nexus:latest) [![Image Layers](https://img.shields.io/imagelayers/layers/stangenberg/nexus/latest.svg)](https://imagelayers.io/?images=stangenberg/nexus:latest)

# Features
- [Nexus Repository][NEXUS]

# Exposed volumes
- /nexus-work

# Exposed ports
- 9000 / HTTP

# Environment Variables
- NEXUS_VERSION - contains the installed nexus version
- JAVA_OPTS - java options for the jvm, default `-Xms256m -Xmx1g -Djava.awt.headless=true -server -Djava.net.preferIPv4Stack=true`
- NEXUS_APPLICATION_HOST 0.0.0.0
- NEXUS_APPLICATION_PORT 9000
- NEXUS_WORK /nexus-work
- NEXUS_CONTEXT_PATH /

# Usage
Run nexus repository as docker container.

`docker run --name="nexus" -p 9000:9000 stangenberg/nexus`

# Build
Make is used as build system.
- `make` / starts normal docker build.
- `make run` / build and run the container. This uses `nexus` as container name and automatically stops a running container with an equal name beforehand.
- `make bash` /  build, run the container and start a bash prompt.
- `make ncbuild` / normal build without using the docker cache ( --no-cache ).

[Docker Build Reference https://docs.docker.com/reference/builder/](https://docs.docker.com/reference/builder/)

# License
[Published under the MIT License][LICENSE]

[nexus]: http://www.sonatype.org/nexus/
[dockerhub]: https://hub.docker.com/r/stangenberg/nexus
[license]: https://github.com/stangenberg/docker-nexus/blob/master/LICENSE.md
