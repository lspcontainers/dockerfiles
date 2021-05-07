FROM alpine:3.13.5 as build

ARG VERSION

RUN apk add --no-cache bash g++ gcc git ninja

WORKDIR /build

RUN git clone --depth 1 --branch "${VERSION}" https://github.com/sumneko/lua-language-server \
  && cd lua-language-server \
  && git submodule update --init --recursive

RUN cd lua-language-server/3rd/luamake \
  && compile/install.sh \
  && cd ../.. \
  && ./3rd/luamake/luamake rebuild


FROM alpine:3.13.5

WORKDIR /lua-language-server

COPY --from=build /build/lua-language-server .

CMD [ "./bin/Linux/lua-language-server", "-E", "main.lua" ]
