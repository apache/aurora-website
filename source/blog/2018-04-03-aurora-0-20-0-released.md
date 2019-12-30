---
layout: post
title: 0.20.0 Released
permalink: /blog/aurora-0-20-0-released/
published: true
post_author:
  display_name: Renan DelValle
tags: Release
---

The latest Apache Aurora release, 0.20.0, is now available for
[download](http://aurora.apache.org/downloads/). Here are some highlights in this release:

- Updated to Mesos 1.4.0.
- Added experimental support for the Mesos partition-aware APIs. The key idea is a new ScheduleStatus
  PARTITIONED that represents a task in an unknown state. Users of Aurora can have per-job policies
  of whether or not to reschedule and how long to wait for the partition to heal. Backwards
  compatibility with existing behavior (i.e. transition to LOST immediately on a partition) is
  maintained. The support is experimental due to bugs found in Mesos that would cause issues in
  a production cluster. For that reason, the functionality is behind a new flag `-partition_aware`
  that is disabled by default. When Mesos support is improved and the new behavior is vetted in
  production clusters, we'll enable this by default.
- Added the ability to inject custom offer holding and scheduling logic via the `-offer_set_module`
  scheduler flag. To take advantage of this feature, you will need to implement the `OfferSet`
  interface.
- Added `executor_config` field to the Job object of the DSL which will populate
  `JobConfiguration.TaskConfig.ExecutorConfig`. This allows for using custom executors defined
  through the `--custom_executor_config` scheduler flag. See our
  [custom-executors](https://aurora.apache.org/documentation/0.20.0/features/custom-executors/) documentation for more information.
- Added support in Thermos Observer for delegating disk usage monitoring to Mesos agent. The feature
  can be enabled via `--enable_mesos_disk_collector` flag, in which case Observer will use the
  agent's containers HTTP API to query the amount of used bytes for each container. Note that disk
  isolation should be enabled in Mesos agent. This feature is not compatible with authentication
  enabled agents.

Deprecations and removals:

- Removed the ability to recover from SQL-based backups and snapshots.  An 0.20.0 scheduler
  will not be able to recover backups or replicated log data created prior to 0.19.0.
- Removed task level resource fields (`numCpus`, `ramMb`, `diskMb`, `requestedPorts`).
- Removed the `-offer_order_modules` scheduler flag related to custom injectable offer orderings,
  since this will now be subsumed under custom `OfferSet` implementations (see the comment above):

Full release notes are available in the release
[CHANGELOG](https://gitbox.apache.org/repos/asf?p=aurora.git&f=CHANGELOG&hb=rel/0.20.0).

## Thanks

Thanks to the 12 contributors who made Apache Aurora 0.20.0 possible:

* Jing Chen
* Franck Cuny
* Renan DelValle
* Nicolás Donatucci
* Stephan Erb
* Bill Farner
* Juan Manuel Fresia
* Jordan Ly
* David McLaughlin
* Reza Motamedi
* Ruben D. Porras
* John Sirois

