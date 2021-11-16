FROM ruby:alpine

ARG VERSION
RUN apk add --no-cache build-base
RUN gem install solargraph -v $VERSION

CMD [ "solargraph", "stdio" ]
