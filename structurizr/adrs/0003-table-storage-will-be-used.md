# 3. Table storage will be used mostly for storage

Date: 2024-10-23

## Status

Accepted

## Context

Most of the information we need to store dont require a database, and so Azure Table Storage will be used for most of the storage.


## Decision

Table storage is very economical, and is also really quick and simple to use and setup. 

## Consequences

No secondary indexes: You cannot create secondary indexes, so we must design our data model carefully to ensure efficient querying using the primary keys.
