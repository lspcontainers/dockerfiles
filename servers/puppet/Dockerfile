FROM alpine

RUN apk add --no-cache \
  g++ \
  gcc \
  git \
  make \
  ruby \
  ruby-dev \
  ruby-bundler \
  zlib-dev \
  && git clone https://github.com/puppetlabs/puppet-editor-services.git /opt/puppet-editor-services \
  && cd /opt/puppet-editor-services \
  && bundle install \
  && gem install puppet-lint voxpupuli-puppet-lint-plugins \
  && apk del git make ruby-dev zlib-dev

ENV PATH="${PATH}:/opt/puppet-editor-services"

CMD [ "puppet-languageserver", "--stdio" ]
