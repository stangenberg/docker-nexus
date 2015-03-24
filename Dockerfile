FROM thstangenberg/baseimage:latest

MAINTAINER Thorben Stangenberg <thorben@stangenberg.ch>

## Do what is needed

## set an environent variable
#ENV name value

## add files
#ADD src dest 

## run a command 
#RUN command

## expose a port 
#EXPOSE port

# Clean up when done.
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* \
           /tmp/* \
           /var/tmp/* 
