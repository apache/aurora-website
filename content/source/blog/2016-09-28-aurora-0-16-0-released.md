---
layout: post
title: 0.16.0 Released
permalink: /blog/aurora-0-16-0-released/
published: true
post_author:
  display_name: Joshua Cohen
  twitter: heyjoshua
tags: Release
---

The latest Apache Aurora release, 0.16.0, is now available for
[download](http://aurora.apache.org/downloads/). Here are some highlights in this release:

- Upgraded Mesos to 1.0.0. Note: as part of this upgrade we have switched from depending on
  the mesos.native egg for Thermos in favor of the stripped down mesos.executor egg. This means
  users launching Docker tasks with the Mesos DockerContainerizer are no longer required to use
  images that include all of Mesos's dependencies.
- Scheduler command line behavior has been modified to warn users of the deprecation of `production`
  attribute in `Job` thrift struct. The scheduler is queried for tier configurations and the user's
  choice of `tier` and `production` attributes is revised, if necessary. If `tier` is already set,
  the `production` attribute might be adjusted to match the `tier` selection. Otherwise, `tier` is
  selected based on the value of `production` attribute. If a matching tier is not found, the
  `default` tier from tier configuration file (`tiers.json`) is used.
- The `/offers` endpoint has been modified to display attributes of resource offers as received
  from Mesos. This has affected rendering of some of the existing attributes. Furthermore, it now
  dumps additional offer attributes including [reservations](http://mesos.apache.org/documentation/latest/reservation/)
  and [persistent volumes](http://mesos.apache.org/documentation/latest/persistent-volume/).
- The scheduler API now accepts both thrift JSON and binary thrift. If a request is sent without a
  `Content-Type` header, or a `Content-Type` header of `application/x-thrift` or `application/json`
  or `application/vnd.apache.thrift.json` the request is treated as thrift JSON. If a request is
  sent with a `Content-Type` header of `application/vnd.apache.thrift.binary` the request is treated
  as binary thrift. If the `Accept` header of the request is `application/vnd.apache.thrift.binary`
  then the response will be binary thrift. Any other value for `Accept` will result in thrift JSON.
- Scheduler is now able to launch jobs using more than one executor at a time. To use this feature
  the `-custom_executor_config` flag must point to a JSON file which contains at least one valid
  executor configuration as detailed in the [configuration](docs/features/custom-executors.md)
  documentation.
- Add rollback API to the scheduler and new client command to support rolling back
  active update jobs to their initial state.
- <a name="zk_use_curator_upgrade"></a> The scheduler flag `-zk_use_curator` now defaults to `true`
  and care should be taken when upgrading from a configuration that does not pass the flag. The
  scheduler upgrade should be performed by bringing all schedulers down, and then bringing upgraded
  schedulers up. A rolling upgrade would result in no leading scheduler for the duration of the
  roll which could be confusing to monitor and debug.
- A new command `aurora_admin reconcile_tasks` is now available on the Aurora admin client that can trigger
  implicit and explicit task reconciliations.
- Add a new MTTS (Median Time To Starting) metric in addition to MTTA and MTTR.
- In addition to CPU resources, RAM resources can now be treated as revocable via the scheduler
  commandline flag `-enable_revocable_ram`.
- Introduce UpdateMetadata fields in JobUpdateRequest to allow clients to store metadata on update.
- Changed cronSchedule field inside of JobConfiguration schema to be optional for compatibility with Go.
- Update default value of command line option `-framework_name` to 'Aurora'.
- Tasks launched with filesystem images and the Mesos unified containerizer are now fully isolated from
  the host's filesystem. As such they are no longer required to include any of the executor's
  dependencies (e.g. Python 2.7) within the task's filesystem.

Deprecations and removals:

- The job configuration flag `production` is now deprecated. To achieve the same scheduling behavior
  that `production=true` used to provide, users should elect a `tier` for the job with attributes
  `preemptible=false` and `revocable=false`. For example, the `preferred` tier in the default tier
  configuration file (`tiers.json`) matches the above criteria.
- The `ExecutorInfo.source` field is deprecated and has been replaced with a label named `source`.
  It will be removed from Mesos in a future release.
- The scheduler flag `-zk_use_curator` has been deprecated. If you have never set the flag and are
  upgrading you should take care as described in the [note](#zk_use_curator_upgrade) above.
- The `key` argument of `getJobUpdateDetails` has been deprecated. Use the `query` argument instead.
- The --release-threshold option on `aurora job restart` has been removed.

Full release notes are available in the release
[CHANGELOG](https://gitbox.apache.org/repos/asf?p=aurora.git&f=CHANGELOG&hb=rel/0.16.0).

## Getting Involved

We encourage you to try out this release and let us know what you think. If you run into any issues,
please let us know on the [user mailing list and IRC](https://aurora.apache.org/community/).

## Thanks

Thanks to the 16 contributors who made Apache Aurora 0.16.0 possible:


* David McLaughlin
* David Robinson
* Dmitriy Shirchenko
* Igor Morozov
* John Sirois
* Joshua Cohen
* Kai Huang
* Karthik Anantha Padmanabhan
* Maxim Khutornenko
* Mehrdad Nurolahzade
* Renan DelValle
* Santhosh Kumar Shanmugham
* Stephan Erb
* Tarun Gogineni
* Zameer Manji
* Zhitao Li
