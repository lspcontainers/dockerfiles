FROM debian:stable-slim as build

WORKDIR /tmp

RUN apt update \
  && apt install curl -y

ARG VERSION

RUN curl -L -O "https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v${VERSION}/omnisharp-linux-x64.tar.gz" \ 
  && tar -xf omnisharp-linux-x64.tar.gz \
  && rm omnisharp-linux-x64.tar.gz 

FROM debian:stable-slim

COPY --from=build /tmp /usr

CMD [ "/usr/run", "--stdio" ]
