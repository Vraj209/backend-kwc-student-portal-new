# Stage 1: Build
FROM node:22 AS builder

WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies, including dev dependencies (for TypeScript)
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the TypeScript application
RUN npm run build

# Stage 2: Production
FROM node:22-slim AS production

WORKDIR /usr/src/app

# Copy only the necessary files from the builder stage
COPY --from=builder /usr/src/app/dist ./dist
COPY --from=builder /usr/src/app/package*.json ./
COPY --from=builder /usr/src/app/.env ./

# Install only production dependencies
RUN npm install --production

# Expose the application port
EXPOSE 3000

# Command to run the application
CMD ["node", "dist/index.js"]
