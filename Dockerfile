FROM node:10
RUN mkdir /src
WORKDIR /src
COPY ./package.json /src/package.json
COPY ./package-lock.json /src/package-lock.json
RUN npm install

COPY ./app /src/app
COPY ./bin /src/bin
COPY ./public /src/public

COPY ./nodemon.json /src/nodemon.json
ENV NODE_ENV development

EXPOSE 3000
CMD ["node", "node_modules/.bin/nodemon", "-L", "bin/www"]