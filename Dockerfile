FROM golang:1.18.3-alpine as build
WORKDIR /go/src/github.com/suyashkumar/ssl-proxy
RUN apk add --no-cache make git zip
COPY . .
RUN make

FROM gcr.io/distroless/static-debian11
COPY --from=build /go/src/github.com/suyashkumar/ssl-proxy/ssl-proxy /
CMD [ "/ssl-proxy" ]
