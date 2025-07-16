FROM debian:12.11-slim

WORKDIR /tmp

RUN apt-get update \
    && apt-get install curl --no-install-recommends --yes \
    && apt-get reinstall ca-certificates --yes \
    && update-ca-certificates \
    && curl -L -O https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.38.0/omnisharp-linux-x64.tar.gz \
    && tar -xf omnisharp-linux-x64.tar.gz -C /usr \
    && rm omnisharp-linux-x64.tar.gz \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

CMD [ "/usr/run", "--languageserver" ]
