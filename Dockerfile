FROM node:8

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ARG NODE_ENV
ENV NODE_ENV $NODE_ENV

COPY package.json /usr/src/app/
COPY yarn.lock /usr/src/app/

RUN yarn install --frozen-lockfile && yarn cache clean --force

COPY . /usr/src/app

ENTRYPOINT [ "./bin/hubot" ]
CMD [ "-a", "slack" ]
