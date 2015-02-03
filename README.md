# Docker_Epiphany_SDK [![Docker repo](http://img.shields.io/badge/docker-repo-blue.svg)](https://registry.hub.docker.com/u/philipz/epiphany_sdk/)
######################
Reference: [Epiphany SDKをPCにインストールする](http://cellspe.matrix.jp/parallella/inst_esdk_pc.html)

Use [offical Ubuntu docker image](https://registry.hub.docker.com/_/ubuntu/) to build the cross compiler environment.

##How to use
Just install [Docker](https://www.docker.com/) and `docker run -ti --rm -v /home/ubuntu/esdk:/root/projects philipz/epiphany_sdk`
