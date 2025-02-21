# Use an official Node.js image as the base image (Node 18)
FROM node:18-alpine

# Enable Corepack (to manage Yarn version)
RUN corepack enable

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and yarn.lock to the container to install dependencies
COPY package.json yarn.lock ./

# Install all dependencies using the specified Yarn version
RUN yarn install

# Copy the rest of the application files to the container
COPY . .

# Ensure node_modules is present
RUN yarn install

# Expose port 3000 (Backstage default port)
EXPOSE 3000

# Start the application in development mode
CMD ["yarn", "dev"]
