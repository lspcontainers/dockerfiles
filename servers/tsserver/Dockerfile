FROM alpine:3.15.0

RUN apk add --no-cache \
  nodejs \
  npm

RUN npm install -g \
  typescript-language-server \
  typescript

CMD [ "/usr/bin/typescript-language-server", "--stdio" ]
