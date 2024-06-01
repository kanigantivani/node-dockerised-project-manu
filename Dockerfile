FROM node:latest
WORKDIR /usr/src/apps
ADD . .
RUN npm install
CMD ["node", "index.js"]
