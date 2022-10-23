#!/bin/bash
set -eu pipefail

LSPCONTAINERS_GROUP=$(id -g)
LSPCONTAINERS_USER=$(id -u)

sudo usermod -u $LSPCONTAINERS_USER lspcontainers \
    && sudo groupmod -g $LSPCONTAINERS_GROUP lspcontainers || true \
    && exec "gopls"
