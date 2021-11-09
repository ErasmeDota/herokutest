# First temporary container to build the vuejs app
FROM node:14.15-alpine as build-node
WORKDIR /frontend

COPY package.json yarn.lock ./
COPY ./ ./
RUN yarn
RUN yarn run build


FROM nginx:1.21.3
# Listen on port 80
EXPOSE 80

COPY --from=build-node /frontend/dist /usr/share/nginx/html
COPY nginx/nginx.conf /etc/nginx/conf.d/default.

CMD  ["nginx", "-g", "daemon off;"]