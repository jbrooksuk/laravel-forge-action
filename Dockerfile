FROM alpine:3.13.0

RUN apk add --no-cache curl

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
