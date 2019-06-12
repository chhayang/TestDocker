FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

#Stage 2
FROM nginx
COPY --from=node /app/dist/TestDocker /usr/share/nginx/html
