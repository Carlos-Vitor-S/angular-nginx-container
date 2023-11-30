FROM node:latest as angular
WORKDIR /app
COPY package.json /app
RUN npm install --silent
COPY . .
RUN npm run build

#Usar o servidor nginx http

FROM nginx:alpine

VOLUME /var/cache/nginx
COPY --from=angular app/dist/app /usr/share/nginx/html

EXPOSE 8080


