FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt upgrade -y && \
    apt install -y curl \
        git \
        python3 \
        sudo \
        vim

# create non-root user and disable password when using sudo
RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER docker
WORKDIR /home/docker

# copy and install dev environment
COPY . /home/docker/dotfiles
RUN sh -c '/home/docker/dotfiles/install.sh'

ENTRYPOINT exec zsh
