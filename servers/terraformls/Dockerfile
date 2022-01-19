FROM alpine:3.15.0 as build

RUN apk add --no-cache --virtual \
  build-deps \
  curl \
  gnupg

WORKDIR /build

ARG LSP_VERSION="0.25.2"
ARG TERRAFORM_VERSION="1.1.3"

RUN curl --proto '=https' --tlsv1.2 -fsSLO https://releases.hashicorp.com/terraform-ls/${LSP_VERSION}/terraform-ls_${LSP_VERSION}_linux_amd64.zip \
  --next -fsSLO https://releases.hashicorp.com/terraform-ls/${LSP_VERSION}/terraform-ls_${LSP_VERSION}_SHA256SUMS \
  --next -fsSLO https://releases.hashicorp.com/terraform-ls/${LSP_VERSION}/terraform-ls_${LSP_VERSION}_SHA256SUMS.sig \
  --next -fsSLO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  --next -fsSLO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS \
  --next -fsSLO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS.sig \
  --next -s -o hashicorp.asc https://keybase.io/hashicorp/pgp_keys.asc \
  && gpg --import ./hashicorp.asc \
  && grep terraform-ls_${LSP_VERSION}_linux_amd64.zip terraform-ls_${LSP_VERSION}_SHA256SUMS > SHA256SUMS \
  && grep terraform_${TERRAFORM_VERSION}_linux_amd64.zip terraform_${TERRAFORM_VERSION}_SHA256SUMS > TERRAFORM_SHA256SUMS \
  && gpg --verify terraform-ls_${LSP_VERSION}_SHA256SUMS.sig terraform-ls_${LSP_VERSION}_SHA256SUMS \
  && gpg --verify terraform_${TERRAFORM_VERSION}_SHA256SUMS.sig terraform_${TERRAFORM_VERSION}_SHA256SUMS \
  && sha256sum -c SHA256SUMS \
  && sha256sum -c TERRAFORM_SHA256SUMS \
  && unzip terraform-ls_${LSP_VERSION}_linux_amd64.zip \
  && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip

FROM alpine:3.15.0

COPY --from=build /build/terraform-ls /usr/bin/terraform-ls
COPY --from=build /build/terraform /usr/bin/terraform

CMD [ "/usr/bin/terraform-ls", "serve" ]
