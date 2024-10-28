FROM golang:1.16-alpine

EXPOSE 8080

ENV PORT=8080

WORKDIR /usr/src/app

COPY example-backend .

RUN go build && \
    addgroup -S backend-group && adduser -S backend-user -G backend-group && \
    rm -rf /var/cache/apk/*

USER backend-user

CMD ["./server"]


