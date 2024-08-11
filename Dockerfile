# Step 1: Build the Go application
FROM golang:1.21-alpine AS builder

WORKDIR /app

COPY . .

RUN go mod tidy
RUN go build -o kyoto

# Step 2: Create a lightweight image with the compiled binary
FROM alpine:3.18

RUN apk add curl

WORKDIR /app

COPY --from=builder /app/kyoto .

EXPOSE 8080

HEALTHCHECK CMD curl -f http://localhost:8080/status || exit 1

CMD ["./kyoto"]
