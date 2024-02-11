FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y sudo
RUN apt-get install -y git
RUN apt-get install -y init systemd

ARG USERNAME=user
ARG GROUPNAME=user
ARG UID=1000
ARG GID=1000
ARG PASSWORD=user
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID -G sudo $USERNAME && \
    echo $USERNAME:$PASSWORD | chpasswd && \
    echo "$USERNAME   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
#USER $USERNAME
WORKDIR /home/$USERNAME/
RUN apt-get install g++ make cmake swig rst2pdf help2man texinfo
RUN make cfgclean python debian
RUN sudo dpkg -i build/debian/python3-simulavr*.deb





CMD ["/sbin/init"]