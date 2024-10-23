# 5. Blob storage will be used for storage for images, tickets and invoices

Date: 2024-10-23

## Status

Accepted

## Context

Since our application is for selling tickets, it will be important that we have somewhere to store the tickets, and invoices.

## Decision

Blob storage is easy to setup and works well with other Azure services like functions, Table storage, which we are going to be working with and it also is relatively cheap. 

## Consequences

No content-based search: If you need to search within the content of blobs (e.g., text files, documents), you need to rely on additional services like Azure Cognitive Search, which increases complexity and cost.