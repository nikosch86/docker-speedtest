FROM node:9-alpine

ENV NODE_ENV production

WORKDIR /app
COPY package.json /app
RUN yarn
COPY . /app

CMD [ "npx", "speedtest-net"]
