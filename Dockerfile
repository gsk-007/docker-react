# build stage
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# runtime stage
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
