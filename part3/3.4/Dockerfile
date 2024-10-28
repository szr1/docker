FROM docker

WORKDIR /usr/src/app

# copy sources
COPY builder.sh .

# run installer
ENTRYPOINT ["./builder.sh"]
