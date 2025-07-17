FROM debian:12.11-slim
# The binary requires gnu-libc and will not work on alpine

ARG VERSION=0.27.0
LABEL version="${VERSION}"

WORKDIR /tmp

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
&& apt-get install --yes --no-install-recommends -o APT::Install-Suggests=0 -o APT::Install-Recommends=0 \
  curl=7.88.1-10+deb12u12 \
  ca-certificates=20230311+deb12u1 \
  unzip=6.0-28 \
&& update-ca-certificates \
&& curl -sL -O https://github.com/redhat-developer/vscode-xml/releases/download/${VERSION}/lemminx-linux.zip  \
&& unzip lemminx-linux.zip  \
&& rm -rf lemminx-linux.zip  \
&& apt-get remove curl unzip -y \
&& apt-get autoremove -y  \
&& apt-get clean -y  \
&& rm -rf /var/lib/apt/lists  \
&& mv lemminx-linux /root/

CMD [ "/root/lemminx-linux", "--stdio" ]
