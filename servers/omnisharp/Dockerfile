FROM debian:12.11-slim

ARG VERSION=1.39.12
LABEL version="${VERSION}"

WORKDIR /tmp

RUN apt-get update \
    && apt-get install curl=7.88.1-10+deb12u12 --no-install-recommends --yes \
    && apt-get reinstall ca-certificates=20230311+deb12u1 --yes \
    && update-ca-certificates \
    && curl -L -O https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v${VERSION}/omnisharp-linux-x64.tar.gz \
    && tar -xf omnisharp-linux-x64.tar.gz -C /usr \
    && rm omnisharp-linux-x64.tar.gz \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

CMD [ "/usr/run", "--languageserver" ]
