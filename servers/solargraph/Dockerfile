FROM ruby:alpine

ARG VERSION
RUN apk add --no-cache build-base
RUN gem install solargraph -v $VERSION
RUN gem install solargraph-rails --pre

CMD [ "solargraph", "stdio" ]
