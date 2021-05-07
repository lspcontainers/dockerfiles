FROM lspcontainers/node_base:14

ARG VERSION

RUN npm install -g yaml-language-server@${VERSION}

CMD [ "yaml-language-server", "--stdio" ]
