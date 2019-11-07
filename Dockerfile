FROM node:alpine as epito
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=epito /app/build /usr/share/nginx/html