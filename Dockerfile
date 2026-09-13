FROM ghcr.io/tgdrive/teldrive:latest

# কাজের ডিরেক্টরি সেট করা
WORKDIR /app

# লোকাল থেকে কনফিগ ফাইলটি কন্টেইনারে কপি করা
COPY config.toml /app/config.toml

# সঠিকভাবে সার্ভার রান করার কমান্ড
CMD ["server", "-c", "/app/config.toml"]
