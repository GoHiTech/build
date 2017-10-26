#!/usr/bin/env bash
# https://docs.docker.com/compose/install/
# https://docs.docker.com/compose/completion/

ver='1.16.1'

set -e
[[ $EUID -eq 0 ]] || { echo 'Run as root user...'; exit 1; }

[ -f /usr/local/bin/docker-compose ] || \
  curl -L https://github.com/docker/compose/releases/download/${ver}/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

[ -f /etc/bash_completion.d/docker-compose ] || \
  curl -L https://raw.githubusercontent.com/docker/compose/${ver}/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
