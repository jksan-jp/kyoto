# Step 1: Build the Go application
FROM golang:1.22.6-alpine AS builder

WORKDIR /app

COPY . .

RUN go mod tidy
RUN go build -o kyoto

# Step 2: Create a lightweight image with the compiled binary
FROM alpine:3.20.2

WORKDIR /app

COPY --from=builder /app/kyoto .

EXPOSE 8080

CMD ["./kyoto"]
