---
layout: post
title: 0.13.0 Released
permalink: /blog/aurora-0-13-0-released/
published: true
post_author:
  display_name: Jake Farrell
  twitter: eatfresh
tags: Release
---

The latest Apache Aurora release, 0.13.0, is now available for
[download](http://aurora.apache.org/downloads/). Here are some highlights in this release:

  - Upgraded Mesos to 0.26.0
  - Added a new health endpoint (/leaderhealth) which can be used for load balancer health
    checks to always forward requests to the leading scheduler.
  - Added a new `aurora job add` client command to scale out an existing job.
  - Upgraded the scheduler ZooKeeper client from 3.4.6 to 3.4.8.
  - Added support for dedicated constraints not exclusive to a particular role.
    See [here](/documentation/0.13.0/features/constraints#dedicated-attribute) for more details.
  - Added a new argument `--announcer-hostname` to thermos executor to override hostname in service
    registry endpoint. See [here](/documentation/0.13.0/reference/configuration#announcer-objects) for details.
  - Descheduling a cron job that was not actually scheduled will no longer return an error.
  - Added a new argument `-thermos_home_in_sandbox` to the scheduler for optionally changing
    HOME to the sandbox during thermos executor/runner execution. This is useful in cases
    where the root filesystem inside of the container is read-only, as it moves PEX extraction into
    the sandbox. See [here](/documentation/0.13.0/operations/configuration#docker-containers)
    for more detail.
  - Support for ZooKeeper authentication in the executor announcer. See
    [here](/documentation/0.13.0/operations/security#announcer-authentication) for details.
  - Scheduler H2 in-memory database is now using
    [MVStore](http://www.h2database.com/html/mvstore.html)
    In addition, scheduler thrift snapshots are now supporting full DB dumps for faster restarts.
  - Added scheduler argument `-require_docker_use_executor` that indicates whether the scheduler
    should accept tasks that use the Docker containerizer without an executor (experimental).
  - Jobs referencing invalid tier name will be rejected by the scheduler.
  - Added a new scheduler argument `--populate_discovery_info`. If set to true, Aurora will start
    to populate DiscoveryInfo field on TaskInfo of Mesos. This could be used for alternative
    service discovery solution like Mesos-DNS.
  - Added support for automatic schema upgrades and downgrades when restoring a snapshot that contains
    a DB dump.


Deprecations and removals:

  - Removed deprecated (now redundant) fields:
    - `Identity.role`
    - `TaskConfig.environment`
    - `TaskConfig.jobName`
    - `TaskQuery.owner`
  - Removed deprecated `AddInstancesConfig` parameter to `addInstances` RPC.
  - Removed deprecated executor argument `-announcer-enable`, which was a no-op in 0.12.0.
  - Removed deprecated API constructs related to Locks:
    - removed RPCs that managed locks
      - `acquireLock`
      - `releaseLock`
      - `getLocks`
    - removed `Lock` parameters to RPCs
      - `createJob`
      - `scheduleCronJob`
      - `descheduleCronJob`
      - `restartShards`
      - `killTasks`
      - `addInstances`
      - `replaceCronTemplate`
  - Task ID strings are no longer prefixed by a timestamp.
  - Changes to the way the scheduler reads command line arguments
    - Removed support for reading command line argument values from files.
    - Removed support for specifying command line argument names with fully-qualified class names.

Full release notes are available in the release
[CHANGELOG](https://gitbox.apache.org/repos/asf?p=aurora.git;a=blob;f=CHANGELOG;h=7afa22f58052be26d37f85df4c8406c0bf79a57e;hb=refs/heads/master).

## Getting Involved

We encourage you to try out this release and let us know what you think. If you run into any issues,
please let us know on the [user mailing list and IRC](https://aurora.apache.org/community/). The
community also holds weekly IRC meetings at 11AM Pacific every Monday that you are welcome to join.

## Thanks

Thanks to the 18 contributors who made Apache Aurora 0.13.0 possible:

* Amol Deshmukh
* Ashwin Murthy
* Benjamin Staffin
* Bill Farner
* Dmitriy Shirchenko
* Florian Pfeiffer
* George Sirois
* Jake Farrell
* John Sirois
* Joshua Cohen
* Krish
* Kunal Thakar
* Maxim Khutornenko
* Se Choi
* Stephan Erb
* Tony Dong
* Zameer Manji
* Zhitao Li
