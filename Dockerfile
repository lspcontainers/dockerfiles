# bashls
FROM alpine:3.13.5 as bashls

ARG BASHLS

RUN apk add --no-cache nodejs npm

RUN npm install -g \
  bash-language-server@${BASHLS}

CMD [ "/usr/bin/bash-language-server", "start" ]


# dockerls
FROM alpine:3.13.5 as dockerls

ARG DOCKERLS

RUN apk add --no-cache nodejs npm

RUN npm install -g \
  dockerfile-language-server-nodejs@${DOCKERLS}

CMD [ "/usr/bin/docker-langserver", "--stdio" ]


# gopls
FROM alpine:3.13.5 as gopls

RUN apk add --no-cache go

ENV GO111MODULE="on"

RUN go get github.com/uudashr/gopkgs/v2/cmd/gopkgs \
  && go get github.com/ramya-rao-a/go-outline \
  && go get github.com/cweill/gotests/gotests \
  && go get github.com/fatih/gomodifytags \
  && go get github.com/josharian/impl \
  && go get github.com/haya14busa/goplay/cmd/goplay \
  && go get github.com/go-delve/delve/cmd/dlv \
  && go get github.com/go-delve/delve/cmd/dlv@master \
  && go get honnef.co/go/tools/cmd/staticcheck \
  && go get golang.org/x/tools/gopls

CMD [ "/root/go/bin/gopls" ]


# pyright
FROM alpine:3.13.5 as pyright

ARG PYRIGHT

RUN apk add --no-cache nodejs npm

RUN npm install -g \
  pyright@${PYRIGHT}

CMD [ "/usr/bin/pyright-langserver", "--stdio" ]


# rust_analyzer
FROM alpine:3.13.5 as rust_analyzer

ARG RUST_ANALYZER

ENV RELEASE_URL="https://github.com/rust-analyzer/rust-analyzer/releases/download/${RUST_ANALYZER}/rust-analyzer-linux"

RUN apk add --no-cache \
  curl \
  rust

RUN curl -L ${RELEASE_URL} -o /usr/bin/rust-analyzer \
  && chmod 755 /usr/bin/rust-analyzer

CMD [ "/usr/bin/rust-analyzer" ]


# sumneko_lua
FROM alpine:3.13.5 as build_sumneko_lua

ARG SUMNEKO_LUA

RUN apk add --no-cache \
  bash \
  g++ \
  gcc \
  git \
  ninja

WORKDIR /build

RUN git clone --depth 1 --branch "${SUMNEKO_LUA}" https://github.com/sumneko/lua-language-server \
  && cd lua-language-server \
  && git submodule update --init --recursive

RUN cd lua-language-server/3rd/luamake \
  && compile/install.sh \
  && cd ../.. \
  && ./3rd/luamake/luamake rebuild

FROM alpine:3.13.5 as sumneko_lua

WORKDIR /lua-language-server

COPY --from=build_sumneko_lua /build/lua-language-server .

CMD [ "./bin/Linux/lua-language-server", "-E", "main.lua" ]


# tsserver
FROM alpine:3.13.5 as tsserver

ARG TSSERVER
ARG TYPESCRIPT

RUN apk add --no-cache nodejs npm

RUN npm install -g \
  typescript-language-server@${TSSERVER} \
  typescript@${TYPESCRIPT}

CMD [ "/usr/bin/typescript-language-server", "--stdio" ]


# yamlls
FROM alpine:3.13.5 as yamlls

ARG YAMLLS

RUN apk add --no-cache nodejs npm

RUN npm install -g \
  yaml-language-server@${YAMLLS}

CMD [ "/usr/bin/yaml-language-server", "--stdio" ]
