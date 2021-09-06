FROM debian:bullseye-slim

WORKDIR /tmp

RUN apt-get update \
  && apt-get install curl -y \
  && rm -rf /var/lib/apt/lists

ARG VERSION

RUN curl -L -O "https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v${VERSION}/omnisharp-linux-x64.tar.gz" \ 
  && tar -xf omnisharp-linux-x64.tar.gz -C /usr \
  && rm omnisharp-linux-x64.tar.gz 

CMD [ "/usr/run", "--languageserver" ]
