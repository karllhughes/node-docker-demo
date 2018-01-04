FROM node:9

# Create base directory
RUN mkdir /src
WORKDIR /src

# Install packages
COPY ./package.json /src/package.json
COPY ./package-lock.json /src/package-lock.json
COPY ./nodemon.json /src/nodemon.json
RUN npm install --silent

# Add application code
COPY ./app /src/app
COPY ./bin /src/bin
COPY ./public /src/public

# Set environmental defaults
ENV NODE_ENV development

# Allows port 3000 to be publicly available
EXPOSE 3000

# The run command
CMD ["node", "node_modules/.bin/nodemon", "-L", "bin/www"]
