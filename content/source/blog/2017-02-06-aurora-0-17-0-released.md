---
layout: post
title: 0.17.0 Released
permalink: /blog/aurora-0-17-0-released/
published: true
post_author:
  display_name: Stephan Erb
  twitter: ErbStephan
tags: Release
---

The latest Apache Aurora release, 0.17.0, is now available for
[download](http://aurora.apache.org/downloads/). Here are some highlights in this release.

Major new features:

- Use the `RUNNING` state of a task to indicate it is healthy and behaving as expected.
  A service will remain in `STARTING` state until a configurable amount of consecutive health checks
  have passed. Job updates can therefore rely purely on health checks rather than `watch_secs`
  timeout when deciding an individial instance update state, by setting `watch_secs` to 0.
- The Aurora Scheduler API supports volume mounts per task for the Mesos
  Containerizer if the scheduler is running with the `-allow_container_volumes`
  flag.
- Resolve docker tags to concrete identifiers for DockerContainerizer, so that job configuration
  is immutable across restarts. The feature introduces a new `{{docker.image[name][tag]}}` binder that
  can be used in the Aurora job configuration to resolve a docker image specified by its `name:tag`
  to a concrete identifier specified by its `registry/name@digest`. It requires version 2 of the
  Docker Registry.

Performance improvements:

- Scheduling performance has been improved by scheduling multiple tasks per scheduling round.
- Preemption slot search logic is modified to improve its performance.
  - Multiple reservations are made per task group per round.
  - Multiple reservations are evaluated per round.
- The default logging output has been changed to remove line numbers and inner class information in
  exchange for faster logging.
- The Aurora client is now using the Thrift binary protocol to communicate with the scheduler.
- Added a new flag `--snapshot_hydrate_stores` that controls which H2-backed stores to write fully
  hydrated into the Scheduler snapshot. Can lead to significantly lower snapshot times for large
  clusters if you set this flag to an empty list. Old behavior is preserved by default, but see
  org.apache.aurora.scheduler.storage.log.SnapshotStoreImpl for which stores we currently have
  duplicate writes for.
- New scheduler metrics are added to facilitate monitoring and performance studies (AURORA-1832).


Additional changes:

- Upgraded Mesos to 1.1.0.
- A task's tier is now mapped to a label on the Mesos `TaskInfo` proto.
- Introduce a new `--ip` option to bind the Thermos observer to a specific rather than all
  interfaces.
- Fix error that prevents the scheduler from being launched with `-enable_revocable_ram`.
* The executor will send SIGTERM to processes that self daemonize via double forking.
- Support the deployment of the Aurora scheduler behind HTTPS-enabled reverse proxies: By launching
  scheduler via `-serverset_endpoint_name=https` you can ensure the Aurora client will correctly
  discover HTTPS support via the ZooKeeper-based discovery mechanism.

Full release notes are available in the release
[CHANGELOG](https://gitbox.apache.org/repos/asf?p=aurora.git&f=CHANGELOG&hb=rel/0.17.0).

## Getting Involved

We encourage you to try out this release and let us know what you think. If you run into any issues,
please let us know on the [user mailing list and IRC](https://aurora.apache.org/community/).

## Thanks

Thanks to the 22 contributors who made Apache Aurora 0.17.0 possible:

* Andrew Jorgensen
* Bing-Qian Luan
* David McLaughlin
* Dmitriy Shirchenko
* Jake Smullin
* Jing Chen
* John Sirois
* Joshua Cohen
* Justin Pinkul
* Kai Huang
* Maxim Khutornenko
* Mehrdad Nurolahzade
* Nicolás Donatucci
* Pierre Cheynier
* Pradyumna Kaushik
* Renan DelValle
* Reza Motamedi
* Rogier Dikkes
* Santhosh Kumar Shanmugham
* Stephan Erb
* Steve Niemitz
* Zameer Manji

