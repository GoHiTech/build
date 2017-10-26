#!/usr/bin/env bash
# https://docs.docker.com/engine/installation/linux/docker-ce/

set -e
[[ $EUID -eq 0 ]] || { echo 'Run as root user...'; exit 1; }

apt-get remove \
  docker \
  docker-engine \
  docker.io

apt-get update && apt-get -y install \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-key fingerprint 0EBFCD88

add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

apt-get update && apt-get -y install \
  docker-ce

usermod -a -G docker ubuntu

systemctl enable docker
systemctl start docker

exit 0
