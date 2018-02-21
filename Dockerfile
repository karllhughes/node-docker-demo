# Specifies the base image we're extending
FROM node:9

# Create base directory
RUN mkdir /src

# Specify the "working directory" for the rest of the Dockerfile
WORKDIR /src

# Install packages using NPM 5 (bundled with the node:9 image)
COPY ./package.json /src/package.json
COPY ./package-lock.json /src/package-lock.json
RUN npm install --silent --dev

# Add application code
COPY ./src /src/src
COPY ./app /src/app
COPY ./bin /src/bin
COPY ./public /src/public

# Add the nodemon and webpack configuration files
COPY ./nodemon.json /src/nodemon.json
COPY ./webpack.config.js /src/webpack.config.js

# Set environment to "development" by default
ENV NODE_ENV development

# Allows port 3000 to be publicly available
EXPOSE 3000

# The command uses nodemon to run the application
CMD ["node", "node_modules/.bin/nodemon", "-L", "bin/www"]
