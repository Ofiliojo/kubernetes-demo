FROM golang:1.13-alpine3.11 AS build

RUN apk add --update \
  git \
  ca-certificates 

RUN mkdir -p /src

WORKDIR /src

COPY go.mod .

COPY go.sum .

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 go build -o /bin/app main.go

# production image
FROM alpine:3.11

RUN apk add --update ca-certificates

RUN mkdir -p /usr/local/bin

COPY --from=build /bin/* /usr/local/bin/
