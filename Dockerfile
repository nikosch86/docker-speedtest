FROM node:22-alpine as builder

RUN apk add --no-cache python3 g++ make

ENV NODE_ENV=production

WORKDIR /app
COPY package.json package-lock.json /app
RUN npm install

FROM node:22-alpine

WORKDIR /app
COPY --from=builder /app/node_modules node_modules
COPY --from=builder /app/package.json /app/package-lock.json .

CMD [ "npx", "speedtest-net", "--accept-license", "--accept-gdpr"]
