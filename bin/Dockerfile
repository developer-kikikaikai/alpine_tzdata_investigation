FROM golang:alpine as build
ENV GO111MODULE=on
RUN apk --no-cache \
      alpine-sdk \
      git \
      && go get github.com/developer-kikikaikai/alpine_tzdata_investigation
WORKDIR /go/src/alpine_tzdata_investigation
RUN go build -o bin/sample sample.go

FROM alpine as final
RUN apk --no-cache add tzdata

COPY --from=build /go/src/alpine_tzdata_investigation/bin/sample /

CMD ["/sample"]
