FROM golang:1.23-alpine

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY . ./

RUN go build -o /main

FROM gcr.io/distroless/static-debian12

COPY --from=0 /main /main
COPY .env /.env
COPY serviceAccountKey.json /serviceAccountKey.json

EXPOSE 8888

CMD ["/main"]
