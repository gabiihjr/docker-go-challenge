FROM golang:1.20 as builder

WORKDIR /usr/src/app

COPY . .

RUN CGO_ENABLED=0 go build -o /app main.go

FROM scratch

COPY --from=builder /app /app

CMD ["/app"]