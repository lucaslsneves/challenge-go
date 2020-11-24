FROM golang:1.15 as builder
WORKDIR /go/src/challenge
COPY . .

RUN GOOS=linux go build -ldflags="-s -w"

FROM scratch
WORKDIR /go/src/challenge
COPY --from=builder /go/src/challenge/challenge .
CMD ["./challenge"]