#!/bin/sh
set -e

GOPLS_USER="$(id -u)"
GOPLS_GROUP="$(id -g)"

sudo usermod -u $GOPLS_USER gopls \
  && sudo groupmod -g $GOPLS_GROUP gopls \
  && sudo chown -R "$GOPLS_USER:$GOPLS_GROUP" /home/gopls \
  && echo "$GOPLS_USER:$GOPLS_GROUP" \
  && exec "gopls"
