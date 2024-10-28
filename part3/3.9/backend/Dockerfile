# Build Stage
FROM golang:1.16-alpine as build-stage

WORKDIR /usr/src/app
COPY example-backend .

ENV REQUEST_ORIGIN=http://localhost:5000
ENV CGO_ENABLED=0 GOOS=linux GOARCH=amd64

# Build the Go binary and name it 'server'
RUN go build -o server .

# Check the contents of the directory
RUN ls -al /usr/src/app

# Final Stage with Scratch
FROM scratch

# Copy the compiled binary from the build stage
COPY --from=build-stage /usr/src/app/server /usr/src/app/server

# Expose the application's port
EXPOSE 8080

# Run the server binary
CMD ["/usr/src/app/server"]




