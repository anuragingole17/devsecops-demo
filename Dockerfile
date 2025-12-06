FROM node:25-alpine as builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

From nginx
copy --from=builder /app/dist /usr/share/nginx/html
EXPOSE 80
CMD  ["nginx", "-g", "daemon off;"]
