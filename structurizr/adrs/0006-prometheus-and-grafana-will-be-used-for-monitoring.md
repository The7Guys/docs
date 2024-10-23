# 6. Prometheus and Grafana will be  used for monitoring

Date: 2024-10-23

## Status

Accepted

## Context

To be able to monitor the services on our application and access logs it will be good to have a platform that can help with that.

## Decision

Prometheus and Grafana come out of the box with Openshift and is well integrated, which makes it a no brainer to use for our application

## Consequences

Prometheus stores data in local files, and while this is performant, it exposes us to data loss if the Prometheus pod or node fails. 