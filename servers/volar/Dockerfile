FROM alpine:3.22.1

RUN apk add --no-cache nodejs=22.16.0-r2 npm=11.3.0-r0

ENV VERSION=1.8.11

RUN npm install -g @vue/language-server@$VERSION

CMD [ "vue-language-server", "--stdio" ]
