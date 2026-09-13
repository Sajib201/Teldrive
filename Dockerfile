FROM golang:1.22-alpine AS builder

RUN apk add --no-cache git make

WORKDIR /app

COPY . .

RUN make build

FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/bin/teldrive /app/teldrive
COPY --from=builder /app/config.toml /app/config.toml

EXPOSE 8080

CMD ["./teldrive", "server"]
