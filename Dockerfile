# stage 1
FROM node:latest as node
# FROM alpine:latest

WORKDIR /brew
COPY . .
# RUN npm run test

# stage 2
FROM nginx:alpine
RUN rm /etc/nginx/conf.d/default.conf
COPY /default.conf /etc/nginx/conf.d/
COPY . /usr/share/nginx/html


# RUN docker run -d -p 8822:80 gbootstrap:v0




