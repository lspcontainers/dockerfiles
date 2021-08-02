FROM ruby:3.0.2-alpine3.13

RUN apk add build-base

ARG VERSION

RUN gem install solargraph -v $VERSION

CMD [ "/usr/local/bundle/bin/solargraph", "stdio" ]
