---
layout: post
title: 0.18.0 Released
permalink: /blog/aurora-0-18-0-released/
published: true
post_author:
  display_name: Santhosh Kumar Shanmugham
  twitter: santhk 
tags: Release
---

The latest Apache Aurora release, 0.18.0, is now available for
[download](http://aurora.apache.org/downloads/). Here are some highlights in this release.

Major new features:

- Added the `-mesos_driver` flag to the scheduler with three possible options:
  `SCHEDULER_DRIVER`, `V0_MESOS`, `V1_MESOS`. The first uses the original driver
  and the latter two use two new drivers from `libmesos`. `V0_MESOS` uses the
  `SCHEDULER_DRIVER` under the hood and `V1_MESOS` uses a new HTTP API aware
  driver. Users that want to use the HTTP API should use `V1_MESOS`.
  Performance sensitive users should stick with the `SCHEDULER_DRIVER` or
  `V0_MESOS` drivers.
- Add observer command line options to control the resource collection interval
  for observed tasks. See [here](docs/reference/observer-configuration.md) for details.
- Added support for reserving agents during job updates, which can substantially reduce update times
  in clusters with high contention for resources. Disabled by default, but can be enabled with
  `enable_update_affinity` option, and the reservation timeout can be controlled via
  `update_affinity_reservation_hold_time`.
- Add `task scp` command to the CLI client for easy transferring of files to/from/between task
  instances. See [here](docs/reference/client-commands.md#scping-with-task-machines) for details.
  Currently only fully supported for Mesos containers (you can copy files from the Docker container
  sandbox but you cannot send files to it).
- Added ability to inject your own scheduling logic, via a lazy Guice module binding. This is an
  alpha-level feature and not subject to backwards compatibility considerations. You can specify
  your custom modules using the `task_assigner_modules` and `preemption_slot_finder_modules` options.
- Added support for resource bin-packing via the `-offer_order` option. You can choose from `CPU`,
  `MEMORY`, `DISK`, `RANDOM` or `REVOCABLE_CPU`. You can also compose secondary sorts by combining
  orders together: e.g. to bin-pack by CPU and MEMORY you could supply `CPU,MEMORY`. The current
  default is `RANDOM`, which has the strong advantage that users can (usually) relocate their tasks
  due to noisy neighbors or machine issues with a task restart. When you have deterministic
  bin-packing, they may always end up on the same agent. So be careful enabling this without proper
  monitoring and remediation of host failures.
- Modified job update behavior to create new instances, then update existing instances, and then
  kill unwanted instances. Previously, a job update would modify each instance in the order of
  their instance ID.
- Added ability to whitelist TaskStateChanges in the webhook configuration file. You can specify
  a list of desired TaskStateChanges(represented by their task statuses) to be sent to a configured
  endpoint.
- Add message parameter to `killTasks` RPC.
- Add `prune_tasks` endpoint to `aurora_admin`. See `aurora_admin prune_tasks -h` for usage information.
- Add support for per-task volume mounts for Mesos containers to the Aurora config DSL.

Additional changes:

- Update to Mesos 1.2.0. Please upgrade Aurora to 0.18 before upgrading Mesos to 1.2.0 if you rely
  on Mesos filesystem images.
  
**NOTE: In this release, the Aurora client will need to be updated before the scheduler
can be deployed.**

Full release notes are available in the release
[CHANGELOG](https://gitbox.apache.org/repos/asf?p=aurora.git&f=CHANGELOG&hb=rel/0.18.0).

## Getting Involved

We encourage you to try out this release and let us know what you think. If you run into any issues,
please let us know on the [user mailing list and IRC](https://aurora.apache.org/community/).

## Thanks

Thanks to the 12 contributors who made Apache Aurora 0.18.0 possible:

* Abhishek Jain
* Charles Raimbert
* Cody Gibb
* David McLaughlin
* Kai Huang
* Mehrdad Nurolahzade
* Nicolás Donatucci
* Reza Motamedi
* Santhosh Kumar Shanmugham
* Stephan Erb
* Takuya Kuwahara
* Zameer Manji

