FROM node:6.11

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app

EXPOSE 5000
RUN npm install
CMD ["npm", "start"]