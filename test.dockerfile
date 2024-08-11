# Stage 1: Build the Angular application
FROM node:18-alpine as build

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm run build

# Stage 2: Serve the application with Node.js
FROM node:18-alpine

WORKDIR /app

COPY --from=build /app/dist/ /app/dist

RUN npm install -g http-server

EXPOSE 8080

CMD ["http-server", "dist/my-angular-project/browser", "-p", "8080"]
