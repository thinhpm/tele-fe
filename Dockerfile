# Build stage
FROM node:18-buster-slim as build

WORKDIR /app

# Install Git
# RUN apk add --no-cache git

COPY package*.json ./
RUN npm install

COPY . .

# Ensure the correct permissions
RUN chown -R node:node /app
USER node

RUN npm run build

RUN npm install -g serve

CMD ["serve", "-s", "build", "-l", "7860"]

EXPOSE 7860
