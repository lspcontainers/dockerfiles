FROM alpine:3.15.0

# using npm breaks shellcheck download of its binary from api.github.com
# running shellcheck -V forces it to download its binary during build
RUN apk add --no-cache \
  nodejs \
  yarn \
  && yarn global add \
    shellcheck \
    bash-language-server \
  && shellcheck -V

CMD [ "bash-language-server", "start" ]
