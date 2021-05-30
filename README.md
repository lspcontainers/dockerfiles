# dockerfiles

Dockerfiles for all LSPs used with `lspcontainers`.

## Installation

This repository requires the latest:

- [Docker Engine](https://docs.docker.com/engine/install/)
- [Docker Compose](https://docs.docker.com/compose/install)

## Build

To build images locally run:

- `docker-compose build <server>` to build a specific server (see `docker-compose.yaml`)
- `docker-compose build` to build all servers
- `docker-compose build --parallel` to build all servers in parallel

## Versions

Every container has two tags available:

- The `latest` tag, which points to the latest container build

- A pinned version and release tag. The pinned version will be the latest
  version of the language server, and we bump the release tag whenever
  something around the container is updated.
