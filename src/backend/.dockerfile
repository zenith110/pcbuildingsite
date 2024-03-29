FROM golang:1.20.0-alpine3.17 as builder


WORKDIR /home/backend/v2
COPY . /home/backend/v2

RUN go mod download
COPY main.go ./
RUN go build main.go

# Copy the binary and run the binary
FROM alpine:latest
COPY --from=builder /home/backend/v2/ .
CMD ["./main"]