# Build Stage
FROM node:14-alpine as build-stage

WORKDIR /usr/src/app

COPY example-frontend .

RUN npm install && \
    npm run build && \
    rm -rf /var/cache/apk/*

# Production Stage with Nginx
FROM nginx:alpine

# Copy the build output to Nginx's default HTML directory
COPY --from=build-stage /usr/src/app/build /usr/share/nginx/html

# Expose port 80, the default Nginx port
EXPOSE 80

# Nginx runs as non-root by default, no need to add a user
CMD ["nginx", "-g", "daemon off;"]



