FROM golang:1.12 as builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -v -o helloworld

FROM alpine:latest
RUN apk add --no-cache -ca-certificates
COPY --from=builder /app/helloworld /helloworld
CMD ["./helloworld"]
