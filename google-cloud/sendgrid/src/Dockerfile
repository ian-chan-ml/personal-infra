FROM golang:1.22 as builder

WORKDIR /app
COPY . .

RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -o main .

# Switch to Alpine for the final image
FROM alpine:3.14
# Install ca-certificates if your application needs to make HTTPS requests.
RUN apk --no-cache add ca-certificates

COPY --from=builder /app/main /main
RUN chmod +x /main

# Create a group and user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
# Tell docker that all future commands should run as the appuser user
USER appuser

CMD ["/main"]
