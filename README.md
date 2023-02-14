## Description

Api service used to get room availibility in a specific timeframe. Build with [Nest](https://github.com/nestjs/nest) framework.

## Usage

### example request

```http
GET /room/doubleRoomAvailability?start_date=2023-10-01&end_date=2023-11-02 HTTP/1.1
Host: localhost:3000
```

> The dates should be in ISO 8601 format `yyyy-mm-dd`.

## Requirements

nodejs version >= v16.17.0

## Installation

copy the contents of `example.env` file to the `.env` file

```bash
$ npm install
```

## Running the db

### Requirements

postgres version 14, or docker with docker compose

> if you provide your own postgres db please inform the .env file with the correct values

### With docker 
> use one of the commands not both
```bash
# To start the db from scratch and automaticaly populate the tables from the ./prisma/seed.ts file.
# This action will first remove conflicting docker containers and then start the db
$ npm run db:dev:restart

# Just start the DB, you will need to provide the sql file for the api to work
$ npm run db:dev:up
```

## Running the app

```bash
# Generate the prisma models
npx prisma generate

# To start in watch mode
$ npm run start:dev

# production mode
$ npm run build
$ npm run start:prod
```

> if there is a problem with the nest cli tool you might need to install the @nest/cli package globaly
> command: `npm install -g @nestjs/cli`
