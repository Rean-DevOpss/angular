# Stage 1: Build the Angular application
FROM node:18-alpine as build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies and build the Angular application
RUN npm install && npm run build

# Stage 2: Serve the application with Node.js
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy the build output from the first stage
COPY --from=build /app/dist /app/dist

# Install Angular Universal dependencies and production dependencies
RUN npm install -g @nguniversal/express-engine && npm install --only=production

# Expose port 4000 (or any other port your server listens to)
EXPOSE 4000

# Start the Node.js server
CMD ["node", "dist/my-angular-project/server/server.mjs"]
