FROM alpine:3.22.1

RUN apk add --no-cache \
	nodejs=22.16.0-r2 \
	npm=11.3.0-r0 \
	&& npm install -g \
	tailwindcss@4.1.11 \
	@tailwindcss/language-server@0.14.25

CMD ["tailwindcss-language-server", "--stdio"]
