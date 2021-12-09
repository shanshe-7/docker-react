FROM node:16-alpine as build

WORKDIR "/app"

COPY package.json .
RUN yarn install

COPY . .

RUN yarn build

FROM nginx
EXPOSE 80
COPY --from=build /app/build /usr/share/nginx/html