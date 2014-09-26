FROM kjunine/nodejs:latest
MAINTAINER Daniel Ku "kjunine@gmail.com"

ADD . /mnod
WORKDIR /mnod

RUN npm install -g pm2 && npm install

ENV NODE_ENV production
ENV PORT 8080
ENV MONGOHQ_URL mongodb://localhost/mnod
ENV NEW_RELIC_APP_NAME MeaNstackOnDocker
ENV NEW_RELIC_LICENSE_KEY CHANGE_ME

EXPOSE 8080

CMD pm2 start server/app.js -i max --name mnod --no-daemon
