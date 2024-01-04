FROM debian
# The binary requires gnu-libc and will not work on alpine

WORKDIR /tmp

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
&& apt-get install --yes --no-install-recommends -o APT::Install-Suggests=0 -o APT::Install-Recommends=0 \
  curl \
  ca-certificates \
  unzip \
&& update-ca-certificates \
&& curl -sL -O https://github.com/redhat-developer/vscode-xml/releases/download/0.26.1/lemminx-linux.zip  \
&& unzip lemminx-linux.zip  \
&& rm -rf lemminx-linux.zip  \
&& apt-get remove curl unzip -y \
&& apt-get autoremove -y  \
&& apt-get clean -y  \
&& rm -rf /var/lib/apt/lists  \
&& mv lemminx-linux /root/

CMD [ "/root/lemminx-linux", "--stdio" ]
