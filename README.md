# Docker nexus

nexus container

Dockerhub: [stangenberg/nexus][DOCKERHUB]

## Features ##

- [Nexus Repository][NEXUS]


## Exposed volumes ##

- /nexus-work


## Exposed ports ##

- 22 / SSH
- 9000 / HTTP


## Environment Variables

- NEXUS_VERSION - contains the installed nexus version
- JAVA_OPTS - java options for the jvm, default `-Xms256m -Xmx1g -Djava.awt.headless=true -server -Djava.net.preferIPv4Stack=true`
- NEXUS_APPLICATION_HOST 0.0.0.0
- NEXUS_APPLICATION_PORT 9000
- NEXUS_WORK /nexus-work
- NEXUS_CONTEXT_PATH /


## Usage ##

Run nexus repository as docker container.

`docker run --name="nexus" -p 9000:9000 stangenberg/nexus`


## Build

Make is used as build system.

- `make` / starts normal docker build.
- `make run` / build and run the container. This uses `nexus` as container name and automatically stops a running container with an equal name beforehand.
- `make bash` /  build, run the container and start a bash prompt.
- `make ncbuild` / normal build without using the docker cache ( --no-cache ).

[Docker Build Reference https://docs.docker.com/reference/builder/](https://docs.docker.com/reference/builder/)


## License ##

[Published under the MIT License][LICENSE]

[NEXUS]: http://www.sonatype.org/nexus/
[DOCKERHUB]: https://hub.docker.com/u/stangenberg/nexus
[LICENSE]: https://github.com/stangenberg/docker-nexus/blob/master/LICENSE.md
