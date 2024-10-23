# 3. The database will be MySQL via MariaDB

Date: 2024-10-23

## Status

Accepted

## Context

The application will need a database. MySQL is a structured query language which matches with our needs for the app.

## Decision

The application will use MySQL via MariaDB as database, It is quick, open source and relatively cheap. Since we are not going to be making a lot of transactions to the database, MariaDB is going to be perfect for our usecase. All team members also have some experience with working with MySQL and MariaDB, so it is familiar territory.

## Consequences

If the application grows and requires more concurrent access or complex queries, MariaDB may introduce performance bottlenecks if not optimized properly.
