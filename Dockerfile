# Build stage
FROM node:18-buster-slim as build

WORKDIR /app

# Install Git
# RUN apk add --no-cache git

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run build

CMD ["npm", "start"]