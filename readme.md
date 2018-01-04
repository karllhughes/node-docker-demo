# Node Docker Demo

This is a simple application to demonstrate using Docker for local NodeJS app development. It uses Node v9, Express, Sequelize and Postgres for data storage, and Handlebars for views.

## Prerequisites

- [Docker 17.0+](https://docker.com)

## Quickstart

- Clone this repo: `git clone https://github.com/karllhughes/node-docker-demo.git`
  - Note: The `master` branch has all the Docker-related files included, while the `start-here` branch does not. If you plan on doing the tutorial written for Javascript January, use the `start-here` branch, but if you want something that works right away, use the `master` branch.
- Make sure Docker is running and that you're using version 17+ by running: `docker -v`
- Run `docker build -t node-docker .` to build a local version of the image.
- Start a postgres database container _before_ you start the application: `docker run -d --rm -p 5432:5432 -e POSTGRES_USER=admin -v $(pwd)/.data:/var/lib/postgresql/data -v $(pwd)/sql:/sql --name nd-db postgres:9.6`
  - Wait a few seconds for the database to boot up before running any queries on it, especially if this is your first time running the application.
- If it's your first time, run the migrations to create the database table: `docker exec nd-db psql admin admin -f /sql/migrations.sql`
- You can also seed the database with dummy date using: `docker exec nd-db psql admin admin -f /sql/seeds.sql`
- Now you can run the application using Docker: `docker run --rm -p 3000:3000 -d -v $(pwd)/app:/src/app -v $(pwd)/public:/src/public --link nd-db --name nd-app node-docker`
- Check that the containers are running by typing `docker ps` and then navigating to `http://localhost:3000/` in your browser.
- To shut the application down, enter the command `docker stop nd-app nd-db`

If you're new to Docker, be sure to read the complete tutorial for explanations behind the Docker commands used.
  
## Contributing

Contributions on Github are welcome and appreciated! Submit an issue or pull request with your improvements or suggestions.

## License

This software is offered as-is under the MIT License:

> MIT License
> 
> Copyright (c) 2017 Karl L. Hughes
> 
> Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
> 
> The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
> 
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
