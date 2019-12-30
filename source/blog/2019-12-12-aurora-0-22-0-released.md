---
layout: post
title: 0.22.0 Released
permalink: /blog/aurora-0-22-0-released/
published: true
post_author:
  display_name: Renan DelValle
tags: Release
---

The latest Apache Aurora release, 0.22.0, is now available for
[download](http://aurora.apache.org/downloads/). Here are some highlights in this release:

- Updated to Mesos 1.6.1.
- New update strategy added: Variable Batch Update. With this strategy, a job may be updated in
  in batches of different sizes. For example, an update which modifies a total of 10 instances may
  be done in batch sizes of 2, 3, and 5. The number of updated instances must equal the size of the
  current group size in order to move to the next group size. If the number of updated instances is
  greater to the sum of all group sizes, the last group size will be used in perpetuity until all
  instances are updated.
  A new field has been added to `UpdateConfig` called `update_strategy`.
  Update strategy may take a `QueueUpdateStrategy`, `BatchUpdateStrategy`,
  or a `VariableBatchUpdateStrategy` object. `QueueUpdateStrategy` and `BatchUpdateStrategy` take
  a single integer argument while `VariableBatchUpdateStrategy` takes a list of positive integers
  as an argument.
- Users may now set a value for the URI fetcher to rename a downloaded artifact to after it
  has been downloaded.
- Auto pause feature added to VariableBatch strategy and Batch strategy. With this feature enabled,
  when an update is `ROLLING_FORWARD`, the update will automatically pause itself right before
  a new batch is started. (This feature is being released as tested but in beta state. We are
  looking to collect feedback before we consider it fully stable.)
- `loader.load()` now uses memoization on the config file path so that we only load and process
  each config file once.
- Instances run with custom executors will no longer show links to thermos observer.
- Add observer command line option `--disable_task_resource_collection` to disable the collection of
  CPU, memory, and disk metrics for observed tasks. This is useful in setups where metrics cannot be
  gathered reliable (e.g. when using PID namespaces) or when it is expensive due to hundreds of
  active tasks per host.
- Added flag `-sla_aware_kill_non_prod` which allows operators to enable SLA aware killing
  for non-production jobs. Jobs are considered non-production when they are preemptable and/or
  revocable.

Deprecations and removals:

- Deprecated use of Thrift fields `JobUpdateSettings.waitForBatchCompletion` and
  `JobUpdateSettings.updateGroupSize`. Please set the proper `JobUpdateSettings.updateStrategy`
  instead. Note that these same constructs, as represented in the Aurora DSL, are still valid
  as they will be converted to the new field automatically by the client
  for backwards compatibility.
- Backfill code for finding a matching tier to for a Job has been removed. Tier will now be set
  when a Job is received by the scheduler. If no tier is provided, the default tier defined in
  `-tier_config`.

Full release notes are available in the release
[CHANGELOG](https://github.com/apache/aurora/milestone/2?closed=1).

## Thanks

Thanks to the 8 contributors who made Apache Aurora 0.22.0 possible:

* Se Choi
* Raúl Cuza
* Renan DelValle
* Stephan Erb
* Mauricio Garavaglia
* Daniel Knightly
* Philipp Sontag
* Justin Venus

