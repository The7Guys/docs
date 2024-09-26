# 2. The application is developed as a micro service application

Date: 2024-09-18

## Status

Accepted

## Context

According to  enterprise standards: All applications must be developed as micro-service applications unless there are compelling reasons to deviate from this. 


## Decision

The application is developed according to the micro-service architecture

## Consequences

It will be easier to reuse services and to implement a scalabilty and reliability strategy. It will be harder
because it will induce more overhead and become slower because of inter-process instead of in-proces communication.
Also versioning and (functional)testing will become harder.
