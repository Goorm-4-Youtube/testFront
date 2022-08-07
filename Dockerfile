# Build
FROM node:16.16.0-alpine AS build
WORKDIR /var/lib/jenkins/workspace/testFront
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

# Run 
FROM nginx:1.22-alpine
# COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /var/lib/jenkins/worspace/testFront/dist/youtube-clone-ui /usr/share/nginx/html
