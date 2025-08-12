FROM alpine:3

RUN apk add --no-cache speedtest-cli

CMD [ "speedtest-cli", "--secure"]
