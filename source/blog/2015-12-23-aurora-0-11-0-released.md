---
layout: post
title: 0.11.0 Released
permalink: /blog/aurora-0-11-0-released/
published: true
post_author:
  display_name: Bill Farner
  twitter: wfarner
tags: Release
---

The latest Apache Aurora release, 0.11.0, is now available for
[download](http://aurora.apache.org/downloads/). Here are some highlights in this release:

**New/updated**

* Added built-in support for
  [log rotation](/documentation/0.11.0/configuration-reference/#logger) of task stderr/stdout.
* Added support for performing task health checks using a
  [shell command](/documentation/0.11.0/configuration-reference/#healthcheckconfig-objects).
* Added support for accepting an executor configuration in JSON via scheduler command line argument
  `--custom_executor_config` which will override all other the command line arguments and default
   values pertaining to the executor.
* Added a new scheduler flag `--framework_announce_principal` to support use of authorization and
  rate limiting in Mesos.
* Upgraded Mesos to 0.24.1.

**Deprecations and removals**

* The client-side updater has been removed, along with the CLI commands that used it:
  `aurora job update` and `aurora job cancel-update`.  Users are encouraged to take
  advantage of scheduler-driven updates (see `aurora update -h` for usage), which has been a
  stable feature for several releases.
* To support configuration of shell-based health checkers, the `HealthCheckConfig` schema has been
  restructured to more cleanly allow configuring varied types of health checkers.  The following
  fields from `HealthCheckConfig` are now deprecated: `endpoint`, `expected_response`,
  `expected_response_code` in favor of setting them as part of an `HttpHealthChecker`.
* In the scheduler API, the field `JobUpdateSettings.maxWaitToInstanceRunningMs`
  (`UpdateConfig.restart_threshold` in client-side configuration) is now deprecated.
  This setting was brittle in practice, and is ignored by the 0.11.0 scheduler.

Full release notes are available in the release
[CHANGELOG](https://gitbox.apache.org/repos/asf?p=aurora.git&f=CHANGELOG&hb=refs/tags/rel/0.11.0).

## Getting Involved

We encourage you to try out this release and let us know what you think. If you run into any issues,
please let us know on the [user mailing list and IRC](https://aurora.apache.org/community/). The
community also holds weekly IRC meetings at 11AM Pacific every Monday that you are welcome to join.

## Thanks

Thanks to the 13 contributors who made Apache Aurora 0.11.0 possible:

* Bill Farner
* Chris Bannister
* Dmitriy Shirchenko
* George Sirois
* John Sirois
* Joshua Cohen
* Kevin Sweeney
* Maxim Khutornenko
* Paul Cavallaro
* R.B. Boyer
* Renan DelValle
* Tengfei Mu
* Zameer Manji
