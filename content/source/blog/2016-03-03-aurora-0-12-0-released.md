---
layout: post
title: 0.12.0 Released
permalink: /blog/aurora-0-12-0-released/
published: true
post_author:
  display_name: Bill Farner
  twitter: wfarner
tags: Release
---

The latest Apache Aurora release, 0.12.0, is now available for
[download](http://aurora.apache.org/downloads/). Here are some highlights in this release:

  - Upgraded Mesos to 0.25.0.
  - Upgraded the scheduler ZooKeeper client from 3.3.4 to 3.4.6.
  - Added support for configuring Mesos role by passing `-mesos_role` to Aurora scheduler at start time.
    This enables resource reservation for Aurora when running in a shared Mesos cluster.
  - Aurora task metadata is now mapped to Mesos task labels. Labels are prefixed with
    `org.apache.aurora.metadata.` to prevent clashes with other, external label sources.
  - Added new scheduler flag `-default_docker_parameters` to allow a cluster operator to specify a
    universal set of parameters that should be used for every container that does not have parameters
    explicitly configured at the job level.
  - Added support for jobs to specify arbitrary ZooKeeper paths for service registration.  See
    [here](https://github.com/apache/aurora/blob/master/docs/configuration-reference.md#announcer-objects)
    for details.
  - Log destination is configurable for the thermos runner. See the configuration reference for details
    on how to configure destination per-process. Command line options may also be passed through the
    scheduler in order to configure the global default behavior.
  - Env variables can be passed through to task processes by passing `--preserve_env`
    to thermos.
  - Changed scheduler logging to use logback.
    Operators wishing to customize logging may do so with standard logback configuration as described
    [here](http://logback.qos.ch/manual/configuration.html)
  - When using `--read-json`, `aurora` can now load multiple jobs from one json file,
    similar to the usual pystachio structure: `{"jobs": [job1, job2, ...]}`. The
    older single-job json format is also still supported.
  - `aurora config list` command now supports `--read-json`
  - Added scheduler command line argument `-shiro_after_auth_filter`. Optionally specify a class
    implementing javax.servlet.Filter that will be included in the Filter chain following the Shiro
    auth filters.
  - The `addInstances` thrift RPC does now increase job instance count (scale out) based on the
    task template pointed by instance `key`.

Deprecations and removals:

  - Deprecated `AddInstancesConfig` argument in `addInstances` thrift RPC.
  - Deprecated `TaskQuery` argument in `killTasks` thrift RPC to disallow killing tasks across
    multiple roles. The new safer approach is using `JobKey` with `instances` instead.
  - Removed the deprecated field 'ConfigGroup.instanceIds' from the API.
  - Removed the following deprecated `HealthCheckConfig` client-side configuration fields: `endpoint`,
    `expected_response`, `expected_response_code`.  These are now set exclusively in like-named fields
    of `HttpHealthChecker.`
  - Removed the deprecated 'JobUpdateSettings.maxWaitToInstanceRunningMs' thrift api field (
    UpdateConfig.restart_threshold in client-side configuration). This aspect of job restarts is now
    controlled exclusively via the client with `aurora job restart --restart-threshold=[seconds]`.
  - Deprecated executor flag `--announcer-enable`. Enabling the announcer previously required both flags
    `--announcer-enable` and `--announcer-ensemble`, but now only `--announcer-ensemble` must be set.
    `--announcer-enable` is a no-op flag now and will be removed in future version.
  - Removed scheduler command line arguments:
    - `-enable_cors_support`.  Enabling CORS is now implicit by setting the argument
      `-enable_cors_for`.
    - `-deduplicate_snapshots` and `-deflate_snapshots`.  These features are good to always enable.
    - `-enable_job_updates` and `-enable_job_creation`
    - `-extra_modules`
    - `-logtostderr`, `-alsologtostderr`, `-vlog`, `-vmodule`, and `-use_glog_formatter`. Removed
       in favor of the new logback configuration.

Full release notes are available in the release
[CHANGELOG](https://gitbox.apache.org/repos/asf?p=aurora.git&f=CHANGELOG&hb=refs/tags/rel/0.12.0).

## Getting Involved

We encourage you to try out this release and let us know what you think. If you run into any issues,
please let us know on the [user mailing list and IRC](https://aurora.apache.org/community/). The
community also holds weekly IRC meetings at 11AM Pacific every Monday that you are welcome to join.

## Thanks

Thanks to the 17 contributors who made Apache Aurora 0.12.0 possible:

* Amol Deshmukh
* Anant Vyas
* Benjamin Staffin
* Bill Farner
* Dmitriy Shirchenko
* George Sirois
* John Sirois
* Joshua Cohen
* Kasisnu Singh
* Kunal Thakar
* Martin Hrabovcin
* Mauricio Garavaglia
* Maxim Khutornenko
* Stephan Erb
* Tony Dong
* Zameer Manji
* Zhitao Li
