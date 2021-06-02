FROM alpine:3.13.5 as build

RUN apk add --no-cache \
  bash \
  g++ \
  gcc \
  git \
  ninja

WORKDIR /build

ARG VERSION

# hadolint ignore=DL3003
RUN git clone --depth 1 --branch "${VERSION}" https://github.com/sumneko/lua-language-server \
  && cd lua-language-server \
  && git submodule update --init --recursive \
  && cd 3rd/luamake \
  && compile/install.sh \
  && cd ../.. \
  && ./3rd/luamake/luamake rebuild


FROM alpine:3.13.5

WORKDIR /lua-language-server

COPY --from=build /build/lua-language-server .

CMD [ "./bin/Linux/lua-language-server", "-E", "main.lua" ]
