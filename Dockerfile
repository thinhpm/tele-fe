# Build stage
FROM node:18-buster-slim as build

WORKDIR /app

# Install Git
# RUN apk add --no-cache git

COPY package*.json ./
RUN npm install
RUN npm install -g serve

COPY . .

# Ensure the correct permissions
RUN chown -R node:node /app
USER node

RUN npm run build

CMD ["serve", "-s", "build", "-l", "7860"]

EXPOSE 7860
