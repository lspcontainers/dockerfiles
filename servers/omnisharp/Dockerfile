FROM debian:bullseye-slim

WORKDIR /tmp

ARG LSP_VERSION "v1.38.0"

RUN apt-get update \
  && apt-get install curl -y \
  && rm -rf /var/lib/apt/lists

RUN curl -L -O "https://github.com/OmniSharp/omnisharp-roslyn/releases/download/${LSP_VERSION}/omnisharp-linux-x64.tar.gz" \
  && tar -xf omnisharp-linux-x64.tar.gz -C /usr \
  && rm omnisharp-linux-x64.tar.gz

CMD [ "/usr/run", "--languageserver" ]
