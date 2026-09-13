FROM golang:1.22-alpine AS builder

RUN apk add --no-cache git

WORKDIR /app

COPY . .

# সরাসরি go build ব্যবহার করা হলো
RUN go build -o teldrive .

FROM alpine:latest

WORKDIR /app

# বাইনারি ফাইলটি কপি করা হচ্ছে
COPY --from=builder /app/teldrive /app/teldrive

EXPOSE 8080

CMD ["./teldrive", "server"]
