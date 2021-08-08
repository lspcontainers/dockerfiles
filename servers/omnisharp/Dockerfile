FROM alpine:3.13.5 AS ls

RUN apk update
RUN apk add --no-cache \
  bash \
  curl

ARG VERSION

RUN cd $HOME
RUN curl -L -O "https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v${VERSION}/omnisharp-linux-x64.tar.gz" \ 
  && tar -xvf omnisharp-linux-x64.tar.gz -C /usr/ \
  && rm omnisharp-linux-x64.tar.gz 

FROM ls

RUN apk add --no-cache mono --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing && \
    apk add --no-cache --virtual=.build-dependencies ca-certificates && \
    cert-sync /etc/ssl/certs/ca-certificates.crt && \
    apk del .build-dependencies

CMD [ "/usr/run" ]
