FROM alpine:latest

EXPOSE 8080

WORKDIR /usr/src/app

COPY example-backend .

RUN apk add --no-cache go && \
    go build && addgroup -S backend-group && adduser -S backend-user -G backend-group &&\ 
    apk del go && \ 
    rm -rf /var/cache/apk/*

# run as non-root user
USER backend-user

ENTRYPOINT ["./server"]

