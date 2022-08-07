FROM node:16.16.0 AS build
WORKDIR /var/lib/jenkins/workspace/testFront
COPY package.json package-lock.json ./
RUN npm install && npm build --configuration=production
COPY ./dist/youtube-clone-ui ./
CMD ["npm", "install", "http-server"] 
