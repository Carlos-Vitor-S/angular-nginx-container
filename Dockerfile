FROM node:latest as angular
WORKDIR /app
COPY package.json .
RUN npm install 
RUN npm run build


FROM nginx:latest
COPY --from=angular /app/dist/app /usr/share/nginx/html
EXPOSE 8080
