FROM golang:1.13-alpine

ENV GOPROXY="https://proxy.golang.org"
ENV GO111MODULE="on"
ENV NAT_ENV="production"

EXPOSE 8080
WORKDIR /go/src/github.com/icco/cron
RUN apk add --no-cache git
COPY . .

RUN go version

RUN go env

RUN go build -v -o /go/bin/server ./server

CMD ["/go/bin/server"]
