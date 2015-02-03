From ubuntu:latest
MAINTAINER Philipz <philipzheng@gmail.com>

# Install Library
RUN apt-get -qq update && apt-get -y upgrade
RUN apt-get --no-install-recommends install -y kernel-package gdb manpages-dev automake bison flex unzip git libgmp-dev libncurses5-dev libmpc-dev libmpfr-dev texinfo wget ca-certificates
# mkdir
WORKDIR /root
RUN mkdir ~/epiphany-sdk
WORKDIR /root/epiphany-sdk
RUN wget --no-check-certificate https://github.com/adapteva/epiphany-sdk/archive/master.zip
RUN unzip master.zip
RUN mv epiphany-sdk-master sdk
RUN rm master.zip
RUN wget --no-check-certificate https://github.com/adapteva/epiphany-libs/archive/esdk.5.13.09.10.tar.gz
RUN tar -zxf esdk.5.13.09.10.tar.gz
RUN rm esdk.5.13.09.10.tar.gz
RUN mv epiphany-libs-esdk.5.13.09.10 epiphany-libs
WORKDIR /root/epiphany-sdk/sdk
RUN ./download-components.sh
RUN export EPIPHANY_HOME=$HOME/epiphany-sdk
RUN ./build-toolchain.sh
RUN ./build-epiphany-sdk.sh
ADD setenv.sh /root/
RUN mkdir /root/projects
VOLUME /root/projects
WORKDIR /root
ENTRYPOINT /root/setenv.sh
