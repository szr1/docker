FROM node:14-alpine

EXPOSE 5000

WORKDIR /usr/src/app

COPY example-frontend .

RUN npm install && \
    npm run build && \
    npm install -g serve && \
    addgroup -S frontend-group && adduser -S frontend-user -G frontend-group && \
    rm -rf /var/cache/apk/*

USER frontend-user

CMD ["serve", "-s", "-l", "5000", "build"]


