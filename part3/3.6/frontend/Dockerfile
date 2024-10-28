FROM ubuntu:latest

EXPOSE 5000

WORKDIR /usr/src/app

COPY example-frontend .

RUN apt-get update && \
    apt-get -y install curl && \
    curl -sL https://deb.nodesource.com/setup_16.x | bash && \
    apt-get -y install nodejs && \
    npm install && \
    npm run build && \
    npm install -g serve && \
    useradd -m frontend-user && \ 
    apt-get purge -y --auto-remove curl && \ 
    rm -rf /var/lib/apt/lists/*

USER frontend-user

CMD ["serve", "-s", "-l", "5000", "build"]


