# Docker nexus

nexus container

Dockerhub: [thstangenberg/nexus][DOCKERHUB]

## Features ##

- [Nexus Repository][NEXUS]


## Exposed volumes ##

- /nexus-work


## Exposed ports ##

- 22 / SSH
- 9000 / HTTP


## Environment Variables

- NEXUS_VERSION - contains the installed nexus version
- MAX_HEAP - maximal heap for the jvm, default `1g`
- MIN_HEAP - minimal heap for the jvm, default `256m`
- JAVA_OPTS - java options for the jvm, default `-server -Djava.net.preferIPv4Stack=true`


## Usage ##

Run nexus repository as docker container.

`docker run --name="nexus" -p 9000:9000 thstangenberg/nexus`


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
[DOCKERHUB]: https://hub.docker.com/u/stangenberg/docker-nexus
[LICENSE]: https://bitbucket.org/stangenberg/docker-nexus/src/master/LICENSE.md "Published under the MIT License"
