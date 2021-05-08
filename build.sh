#! /usr/bin/env bash
set -e

export BASHLS="1.17.0"
export DOCKERLS="0.4.1"
export GOPLS="0.6.11"
export PYRIGHT="1.1.137"
export RUST_ANALYZER="2021-05-03"
export SUMNEKO_LUA="1.20.5"
export TSSERVER="0.5.1"
export YAMLLS="0.18.0"

docker buildx build \
  --build-arg BASHLS="${BASHLS}" \
  --tag "lspcontainers/bash-language-server:${BASHLS}" \
  --target bashls \
  .

docker buildx build \
  --build-arg DOCKERLS="${DOCKERLS}" \
  --tag "lspcontainers/docker-language-server:${DOCKERLS}" \
  --target dockerls \
  .

docker buildx build \
  --tag "lspcontainers/gopls:${GOPLS}" \
  --target gopls \
  .

docker buildx build \
  --build-arg PYRIGHT="${PYRIGHT}" \
  --tag "lspcontainers/pyright-langserver:${PYRIGHT}" \
  --target pyright \
  .

docker buildx build \
  --build-arg RUST_ANALYZER="${RUST_ANALYZER}" \
  --tag "lspcontainers/rust-analyzer:${RUST_ANALYZER}" \
  --target rust_analyzer \
  .

docker buildx build \
  --build-arg SUMNEKO_LUA="${SUMNEKO_LUA}" \
  --tag "lspcontainers/lua-language-server:${SUMNEKO_LUA}" \
  --target sumneko_lua \
  .

docker buildx build \
  --build-arg TSSERVER="${TSSERVER}" \
  --tag "lspcontainers/typescript-language-server:${TSSERVER}" \
  --target tsserver \
  .

docker buildx build \
  --build-arg YAMLLS="${YAMLLS}" \
  --tag "lspcontainers/yaml-language-server:${YAMLLS}" \
  --target yamlls \
  .
