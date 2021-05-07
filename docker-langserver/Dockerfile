FROM lspcontainers/node_base:14
ARG VERSION

RUN npm install -g dockerfile-language-server-nodejs@${VERSION}

CMD [ "docker-langserver", "--stdio" ]

