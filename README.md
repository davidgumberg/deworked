# Deworked

 Deworked is a self-hosted web application for cataloguing collections of written works.

At present, we support automatically gathering works data from the OpenLibrary archive. In the future, this application will support collections that are a mixture of physical and digital works.

Deworked is still a work in progress.

## Example Instance

A public instance is currently hosted at <https://deworked.xyz>, feel free to add, remove, or edit any work that you please, or to break the application in any way that you are able to. I am still building tools to moderate and sanitize user content, so vandals or bots may deface the instance.

## Usage

- You will have to generate your own credentials.yml.enc by deleting the one in this repo and running `rails credentials:edit`

- Install dependencies
```bundle install```

- Run `bin/dev` to start from Procfile.dev and use SQLite.
- To run from PostgreSQL in production, either set up a PostgreSQL instance configured according to config/database.yml, or set the `DATABASE_URL` env variable.
