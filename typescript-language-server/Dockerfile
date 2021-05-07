FROM lspcontainers/node_base:14
ARG VERSION
 
RUN npm install -g typescript-language-server@${VERSION} typescript

CMD [ "typescript-language-server", "--stdio"]

