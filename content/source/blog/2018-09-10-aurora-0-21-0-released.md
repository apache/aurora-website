---
layout: post
title: 0.21.0 Released
permalink: /blog/aurora-0-21-0-released/
published: true
post_author:
  display_name: Renan DelValle
tags: Release
---

The latest Apache Aurora release, 0.21.0, is now available for
[download](http://aurora.apache.org/downloads/). Here are some highlights in this release:

- Updated to Mesos 1.5.0.
- Introduce ability for tasks to specify custom SLA requirements via the new `SlaPolicy` structs.
  There are 3 different SLA Policies that are currently supported - `CountSlaPolicy`,
  `PercentageSlaPolicy` and `CoordinatorSlaPolicy`. SLA policies based on count and percentage
  express the required number of `RUNNING` instances as either a count or percentage in addition to
  allowing the duration-window for which these requirements have to be satisfied. For applications
  that need more control over how SLA is determined, a custom SLA calculator can be configured a.k.a
  Coordinator. Any action that can affect SLA, will first check with the Coordinator before
  proceeding.

    **IMPORTANT: The storage changes required for this feature will make scheduler
    snapshot backwards incompatible. Scheduler will be unable to read snapshot if rolled back to
    previous version. If rollback is absolutely necessary, perform the following steps:**
    1. Stop all host maintenance requests via `aurora_admin host_activate`.
    2. Ensure a new snapshot is created by running `aurora_admin scheduler_snapshot <cluster>`
    3. Rollback to previous version

  Note: The `Coordinator` interface required for the `CoordinatorSlaPolicy` is experimental at
  this juncture and is bound to change in the future.
- Introduced ability for updates to be 'SLA-aware', or only update instances if it is within SLA,
  using the new `sla_aware` field in `UpdateConfig`. See the bullet point above for an explanation
  of custom SLA requirements.

  **NOTE**: SLA-aware updates will use the desired config's SLA, not the existing config.

  Three additional scheduler options have been added to support this feature:

    1. `max_update_action_batch_size (default: 300)`: the number of update actions to process in a
    batch.
    2. `sla_aware_kill_retry_min_delay (default: 1mins)`: the minimum amount of time to wait before
    retrying an SLA-aware kill (using a truncated binary backoff).
    3. `sla_aware_kill_retry_max_delay (default: 5mins)`: the maximum amount of time to wait before
    retrying an SLA-aware kill (using a truncated binary backoff).

Deprecations and removals:

- Deprecated the `aurora_admin host_drain` command used for maintenance. With this release the SLA
  computations are moved to the scheduler and it is no longer required for the client to compute
  SLAs and watch the drains. The scheduler persists any host maintenance request and performs
  SLA-aware drain of the tasks, before marking the host as `DRAINED`. So maintenance requests
  survive across scheduler fail-overs. Use the newly introduced `aurora_admin sla_host_drain`
  to skip the SLA computations on the admin client.
- Removed resource fields (`numCpus`, `ramMb`, `diskMb`) from ResourceAggregate.

Full release notes are available in the release
[CHANGELOG](https://gitbox.apache.org/repos/asf?p=aurora.git&f=CHANGELOG&hb=rel/0.21.0).

## Thanks

Thanks to the 9 contributors who made Apache Aurora 0.21.0 possible:

* Jing Chen
* Renan DelValle
* Stephan Erb
* Jordan Ly
* David McLaughlin
* John Sirois
* Sameer Parekh
* Reza Motamedi
* Ezequiel Torres Feyuk

