FROM alpine:3.22.1 AS build

ARG VERSION=0.36.5
ARG TF_LS_VERSION=${VERSION}
ARG TF_VERSION=1.12.2
LABEL version="${VERSION}"

RUN apk add --no-cache --virtual \
  build-deps \
  curl=8.14.1-r1 \
  gnupg=2.4.7-r0

WORKDIR /build

RUN curl --proto '=https' \
  --tlsv1.2 -fsSLO https://releases.hashicorp.com/terraform-ls/${TF_LS_VERSION}/terraform-ls_${TF_LS_VERSION}_linux_amd64.zip \
  --next -fsSLO https://releases.hashicorp.com/terraform-ls/${TF_LS_VERSION}/terraform-ls_${TF_LS_VERSION}_SHA256SUMS \
  --next -fsSLO https://releases.hashicorp.com/terraform-ls/${TF_LS_VERSION}/terraform-ls_${TF_LS_VERSION}_SHA256SUMS.sig \
  --next -fsSLO https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip \
  --next -fsSLO https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_SHA256SUMS \
  --next -fsSLO https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_SHA256SUMS.sig \
  --next -s -o hashicorp.asc https://keybase.io/hashicorp/pgp_keys.asc \
  && gpg --import ./hashicorp.asc \
  && grep terraform-ls_${TF_LS_VERSION}_linux_amd64.zip terraform-ls_${TF_LS_VERSION}_SHA256SUMS > SHA256SUMS \
  && grep terraform_${TF_VERSION}_linux_amd64.zip terraform_${TF_VERSION}_SHA256SUMS > TERRAFORM_SHA256SUMS \
  && gpg --verify terraform-ls_${TF_LS_VERSION}_SHA256SUMS.sig terraform-ls_${TF_LS_VERSION}_SHA256SUMS \
  && gpg --verify terraform_${TF_VERSION}_SHA256SUMS.sig terraform_${TF_VERSION}_SHA256SUMS \
  && sha256sum -c SHA256SUMS \
  && sha256sum -c TERRAFORM_SHA256SUMS \
  && unzip -o terraform-ls_${TF_LS_VERSION}_linux_amd64.zip \
  && unzip -o terraform_${TF_VERSION}_linux_amd64.zip

FROM alpine:3.22.1

COPY --from=build /build/terraform-ls /usr/bin/terraform-ls
COPY --from=build /build/terraform /usr/bin/terraform

CMD [ "/usr/bin/terraform-ls", "serve" ]
