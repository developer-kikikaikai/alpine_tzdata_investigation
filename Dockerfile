FROM golang:alpine as build
ENV GO111MODULE=on
COPY sample.go .
RUN go build -o sample sample.go

FROM alpine as final
RUN apk --no-cache add tzdata
COPY --from=build /go/sample /
RUN md5sum /usr/share/zoneinfo/Japan

CMD ["/sample"]
