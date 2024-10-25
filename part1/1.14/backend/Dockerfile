FROM golang:1.16-alpine

WORKDIR /usr/src/app

COPY material-applications/example-backend .

ENV REQUEST_ORIGIN=http://localhost:5000

RUN go build

EXPOSE 8080

CMD ["./server"]


