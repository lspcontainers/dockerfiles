FROM lspcontainers/node_base:14
ARG VERSION
 
RUN npm install -g bash-language-server@${VERSION}

CMD [ "bash-language-server", "start"]

