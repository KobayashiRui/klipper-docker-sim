FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y sudo
RUN apt-get install -y git
RUN apt-get install -y init systemd

ENV DEBIAN_FRONTEND=noninteractive

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
RUN git clone https://github.com/th33xitus/kiauh.git
RUN apt-get install -y avr-libc g++ make cmake swig rst2pdf help2man texinfo python3 python3-dev python3-virtualenv
RUN git clone git://git.savannah.nongnu.org/simulavr.git
RUN pip3 install -U sphinx
RUN pip3 install -U beautifulsoup4 
#WORKDIR /home/$USERNAME/simulavr
#RUN make cfgclean python build

WORKDIR /home/$USERNAME/

COPY run_simulavr.sh . 

CMD ["/bin/bash"]