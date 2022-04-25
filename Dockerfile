FROM golang:1.15.3 as builder
WORKDIR /app/
COPY . .
RUN go build -o app /app/helloworld.go

FROM alpine:latest
WORKDIR /app/
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
COPY --from=builder /app/ /app/
USER appgroup:appuser
CMD ["./app"]