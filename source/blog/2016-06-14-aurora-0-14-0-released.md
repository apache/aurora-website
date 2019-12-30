---
layout: post
title: 0.14.0 Released
permalink: /blog/aurora-0-14-0-released/
published: true
post_author:
  display_name: Stephan Erb
  twitter: ErbStephan
tags: Release
---

The latest Apache Aurora release, 0.14.0, is now available for
[download](http://aurora.apache.org/downloads/). Here are some highlights in this release:

  - Upgraded Mesos to 0.27.2
  - Added a new optional [Apache Curator](https://curator.apache.org/) backend for performing
    scheduler leader election. You can enable this with the new `-zk_use_curator` scheduler argument.
  - Adding --nosetuid-health-checks flag to control whether the executor runs health checks as the
    job's role's user.
  - New scheduler command line argument `-offer_filter_duration` to control the time after which we
    expect Mesos to re-offer unused resources. A short duration improves scheduling performance in
    smaller clusters, but might lead to resource starvation for other frameworks if you run multiple
    ones in your cluster. Uses the Mesos default of 5s.
  - New scheduler command line option `-framework_name`  to change the name used for registering
    the Aurora framework with Mesos. The current default value is 'TwitterScheduler'.
  - Added experimental support for launching tasks using filesystem images and the Mesos [unified
    containerizer](https://github.com/apache/mesos/blob/master/docs/container-image.md). See that
    linked documentation for details on configuring Mesos to use the unified containerizer. Note that
    earlier versions of Mesos do not fully support the unified containerizer. Mesos 0.28.x or later is
    recommended for anyone adopting task images via the Mesos containerizer.
  - Upgraded to pystachio 0.8.1 to pick up support for the new [Choice type](https://github.com/wickman/pystachio/blob/v0.8.1/README.md#choices).
  - The `container` property of a `Job` is now a Choice of either a `Container` holder, or a direct
    reference to either a `Docker` or `Mesos` container.
  - New scheduler command line argument `-ip` to control what ip address to bind the schedulers http
    server to.
  - Added experimental support for Mesos GPU resource. This feature will be available in Mesos 1.0
    and is disabled by default. Use `-allow_gpu_resource` flag to enable it. Once this feature is
    enabled, creating jobs with GPU resource will make scheduler snapshot backwards incompatible.
    For further further details, please see the full release notes.
  - Experimental support for a webhook feature which POSTs all task state changes to a user defined
    endpoint.
  - Added support for specifying the default tier name in tier configuration file (`tiers.json`). The
    `default` property is required and is initialized with the `preemptible` tier (`preemptible` tier
    tasks can be preempted but their resources cannot be revoked).

Deprecations and removals:

  - Deprecated `--restart-threshold` option in the `aurora job restart` command to match the job
    updater behavior. This option has no effect now and will be removed in the future release.
  - Deprecated `-framework_name` default argument 'TwitterScheduler'. In a future release this
    will change to 'aurora'. Please be aware that depending on your usage of Mesos, this will
    be a backward incompatible change. For details, see MESOS-703.
  - The `-thermos_observer_root` command line arg has been removed from the scheduler. This was a
    relic from the time when executor checkpoints were written globally, rather than into a task's
    sandbox.
  - Setting the `container` property of a `Job` to a `Container` holder is deprecated in favor of
    setting it directly to the appropriate (i.e. `Docker` or `Mesos`) container type.
  - Deprecated `numCpus`, `ramMb` and `diskMb` fields in `TaskConfig` and `ResourceAggregate` thrift
    structs. Use `set<Resource> resources` to specify task resources or quota values.
  - The endpoint `/slaves` is deprecated. Please use `/agents` instead.
  - Deprecated `production` field in `TaskConfig` thrift struct. Use `tier` field to specify task
    scheduling and resource handling behavior.
  - The scheduler `resources_*_ram_gb` and `resources_*_disk_gb` metrics have been renamed to
    `resources_*_ram_mb` and `resources_*_disk_mb` respectively. Note the unit change: GB -> MB.

Full release notes are available in the release
[CHANGELOG](https://gitbox.apache.org/repos/asf?p=aurora.git&f=CHANGELOG&hb=rel/0.14.0).

## Getting Involved

We encourage you to try out this release and let us know what you think. If you run into any issues,
please let us know on the [user mailing list and IRC](https://aurora.apache.org/community/). The
community also holds weekly IRC meetings at 11AM Pacific every Monday that you are welcome to join.

## Thanks

Thanks to the 11 contributors who made Apache Aurora 0.14.0 possible:

* Chris Bannister
* Dmitriy Shirchenko
* John Sirois
* Joshua Cohen
* Maxim Khutornenko
* Mehrdad Nurolahzade
* Raymond Khalife
* Renan DelValle
* Stephan Erb
* Zameer Manji
* se choi
