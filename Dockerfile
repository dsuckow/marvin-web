FROM node:14-buster as build

LABEL stage=build

WORKDIR /app

COPY . .

RUN npm ci && \
    npm run-script build:prod

FROM nginx:stable-alpine

COPY --from=build /app/dist/ /usr/share/nginx/html
# COPY --from=build /app/nginx/conf.d/ /etc/nginx/conf.d
# COPY --from=build /app/nginx/nginx.conf /etc/nginx
