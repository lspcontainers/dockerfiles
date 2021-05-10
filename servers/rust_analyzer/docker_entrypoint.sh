#!/bin/sh
set -e

source /root/.cargo/env \
  && exec "$@"
