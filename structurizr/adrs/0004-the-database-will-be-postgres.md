# 3. The database will be Postgres

Date: 2024-09-18

## Status

Accepted

## Context

The application will need a database. Postgres is already used in the company. Maintenance like upgrades
backup an restore are already implemented.

## Decision

The application will use Postrges as database, using a separate schema per micro-service

## Consequences

It will introduce a releational to O-O mapping. Therefor extra code, maintenance and possible mapping errors. A document database like MongoDb would not have this.
