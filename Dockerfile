#stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN ng run build --prod

#stage 2
FROM ngnix
COPY --from=node /app/dist/angrouting /usr/share/ngnix/html