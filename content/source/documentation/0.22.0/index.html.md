## Introduction

Apache Aurora is a service scheduler that runs on top of Apache Mesos, enabling you to run
long-running services, cron jobs, and ad-hoc jobs that take advantage of Apache Mesos' scalability,
fault-tolerance, and resource isolation.

We encourage you to ask questions on the [Aurora user list](http://aurora.apache.org/community/) or
the `#aurora` IRC channel on `irc.freenode.net`.


## Getting Started
Information for everyone new to Apache Aurora.

 * [Aurora System Overview](getting-started/overview/)
 * [Hello World Tutorial](getting-started/tutorial/)
 * [Local cluster with Vagrant](getting-started/vagrant/)

## Features
Description of important Aurora features.

 * [Containers](features/containers/)
 * [Cron Jobs](features/cron-jobs/)
 * [Custom Executors](features/custom-executors/)
 * [Job Updates](features/job-updates/)
 * [Multitenancy](features/multitenancy/)
 * [Resource Isolation](features/resource-isolation/)
 * [Scheduling Constraints](features/constraints/)
 * [Services](features/services/)
 * [Service Discovery](features/service-discovery/)
 * [SLA Metrics](features/sla-metrics/)
 * [SLA Requirements](features/sla-requirements/)
 * [Webhooks](features/webhooks/)

## Operators
For those that wish to manage and fine-tune an Aurora cluster.

 * [Installation](operations/installation/)
 * [Configuration](operations/configuration/)
 * [Upgrades](operations/upgrades/)
 * [Troubleshooting](operations/troubleshooting/)
 * [Monitoring](operations/monitoring/)
 * [Security](operations/security/)
 * [Storage](operations/storage/)
 * [Backup](operations/backup-restore/)

## Reference
The complete reference of commands, configuration options, and scheduler internals.

 * [Task lifecycle](reference/task-lifecycle/)
 * Configuration (`.aurora` files)
    - [Configuration Reference](reference/configuration/)
    - [Configuration Tutorial](reference/configuration-tutorial/)
    - [Configuration Best Practices](reference/configuration-best-practices/)
    - [Configuration Templating](reference/configuration-templating/)
 * Aurora Client
    - [Client Commands](reference/client-commands/)
    - [Client Hooks](reference/client-hooks/)
    - [Client Cluster Configuration](reference/client-cluster-configuration/)
 * [Scheduler Configuration](reference/scheduler-configuration/)
 * [Observer Configuration](reference/observer-configuration/)
 * [Endpoints](reference/scheduler-endpoints/)

## Additional Resources
 * [Tools integrating with Aurora](additional-resources/tools/)
 * [Presentation videos and slides](additional-resources/presentations/)

## Developers
All the information you need to start modifying Aurora and contributing back to the project.

 * [Contributing to the project](contributing/)
 * [Committer's Guide](development/committers-guide/)
 * [Design Documents](development/design-documents/)
 * Developing the Aurora components:
     - [Client](development/client/)
     - [Scheduler](development/scheduler/)
     - [Scheduler UI](development/ui/)
     - [Thermos](development/thermos/)
     - [Thrift structures](development/thrift/)


