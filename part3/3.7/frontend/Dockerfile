FROM node:14-alpine

EXPOSE 5000

WORKDIR /usr/src/app

COPY example-frontend .

RUN npm install && \
    npm run build && \
    npm install -g serve && \
    adduser -D frontend-user && \ 
    rm -rf /var/cache/apk/*

USER frontend-user

CMD ["serve", "-s", "-l", "5000", "build"]


