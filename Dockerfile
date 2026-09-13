FROM golang:1.24-alpine AS builder

RUN apk add --no-cache git

WORKDIR /app

COPY . .

RUN go build -o teldrive .

FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/teldrive /app/teldrive

EXPOSE 8080

CMD ["./teldrive", "server"]
