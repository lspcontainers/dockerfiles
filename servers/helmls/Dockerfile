FROM debian

ADD https://github.com/mrjosh/helm-ls/releases/download/v0.0.17/helm_ls_linux_amd64 /helmls

RUN chmod +x /helmls

CMD [ "/helmls", "serve" ]
