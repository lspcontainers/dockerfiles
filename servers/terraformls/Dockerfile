FROM alpine:3.13.5 as builder

RUN apk add --no-cache --virtual build-deps gnupg curl

ARG VERSION

WORKDIR /home/terraformls

RUN curl --proto '=https' --tlsv1.2 -fsSLO https://releases.hashicorp.com/terraform-ls/${VERSION}/terraform-ls_${VERSION}_linux_amd64.zip \
  --next -fsSLO https://releases.hashicorp.com/terraform-ls/${VERSION}/terraform-ls_${VERSION}_SHA256SUMS \
  --next -fsSLO https://releases.hashicorp.com/terraform-ls/${VERSION}/terraform-ls_${VERSION}_SHA256SUMS.sig \
  --next -s -o hashicorp.asc https://keybase.io/hashicorp/pgp_keys.asc \
  && gpg --import ./hashicorp.asc \
  && echo "$(grep terraform-ls_${VERSION}_linux_amd64.zip terraform-ls_${VERSION}_SHA256SUMS)" > SHA256SUMS \
  && gpg --verify terraform-ls_${VERSION}_SHA256SUMS.sig terraform-ls_${VERSION}_SHA256SUMS \
  && sha256sum -c SHA256SUMS \
  && unzip terraform-ls_${VERSION}_linux_amd64.zip \
  && ./terraform-ls -v

FROM scratch

COPY --from=builder /home/terraformls/terraform-ls /usr/bin/terraform-ls

CMD ["/usr/bin/terraform-ls", "serve"]
