FROM alpine:latest

RUN apk add --no-cache yarn --repository="http://dl-cdn.alpinelinux.org/alpine/edge/community" 
RUN apk add --no-cache openssh-client
RUN apk add --no-cache ca-certificates
