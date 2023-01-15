FROM node:latest as node
WORKDIR /muthu
COPY . .
RUN npm i
RUN npm run build --prod

FROM nginx:alpine
COPY --from=node /muthu/dist/muthu/ /usr/share/nginx/html