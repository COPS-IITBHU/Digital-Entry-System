# Digital-Entry-System

This project aims to fully digitalise the entry and logging system of IIT(BHU) via use of a digital ID to avoid intruders inside the campus.

## Setup

### Server

1. Go to the `server` directory.
2. Add the serviceAccountKey.json file in the backend directory.
3. Add the `JWT_KEY` in the `.env` file.
4. Run `go install` to install the dependencies.
5. Run `go run main.go` to start the server.
6. The server will start on port 8888.

If you want to run the server with docker, follow the steps below:

1. Run `docker build -t digital-entry-server .` to build the docker image.
2. Now, run `docker run -p 8888:8888 digital-entry-server` to start the server.

### Client

TODO
