---
layout: post
title: 0.19.0 Released
permalink: /blog/aurora-0-19-0-released/
published: true
post_author:
  display_name: Bill Farner
tags: Release
---

The latest Apache Aurora release, 0.19.0, is now available for
[download](http://aurora.apache.org/downloads/). Here are some highlights in this release:

- Added the ability to configure the executor's stop timeout, which is the maximum amount of time
  the executor will wait during a graceful shutdown sequence before continuing the 'Forceful
  Termination' process (see
  [here](http://aurora.apache.org/documentation/latest/reference/task-lifecycle/) for details).
- Added the ability to configure the wait period after calling the graceful shutdown endpoint and
  the shutdown endpoint using the `graceful_shutdown_wait_secs` and `shutdown_wait_secs` fields in
  `HttpLifecycleConfig` respectively. Previously, the executor would only wait 5 seconds between
  steps (adding up to a total of 10 seconds as there are 2 steps). The overall waiting period is
  bounded by the executor's stop timeout, which can be configured using the executor's
  `stop_timeout_in_secs` flag.
- Added the `thrift_method_interceptor_modules` scheduler flag that lets cluster operators inject
  custom Thrift method interceptors.
- Increase default ZooKeeper session timeout from 4 to 15 seconds.
- Added option `-zk_connection_timeout` to control the connection timeout of ZooKeeper connections.
- Added scheduler command line argument `-hold_offers_forever`, suitable for use in clusters where
  Aurora is the only framework.  This setting disables other options such as `-min_offer_hold_time`,
  and allows the scheduler to more efficiently cache scheduling attempts.
- The scheduler no longer uses an internal H2 database for storage.
- There is a new Scheduler UI which, in addition to the facelift, provides the ability to inject your
  own custom UI components.

Deprecations and removals:

- Removed the deprecated command line argument `-zk_use_curator`, removing the choice to use the
  legacy ZooKeeper client.
- Removed the `rewriteConfigs` thrift API call in the scheduler. This was a last-ditch mechanism
  to modify scheduler state on the fly. It was considered extremely risky to use since its
  inception, and is safer to abandon due to its lack of use and likelihood for code rot.
- Removed the Job environment validation from the command line client. Validation was moved to the
  the scheduler side through the `allowed_job_environments` option. By default allowing any of
  `devel`, `test`, `production`, and any value matching the regular expression `staging[0-9]*`.
- Removed scheduler command line arguments related to the internal H2 database, which is no longer
  used:
  - `-use_beta_db_task_store`
  - `-enable_db_metrics`
  - `-slow_query_log_threshold`
  - `-db_row_gc_interval`
  - `-db_lock_timeout`
  - `-db_max_active_connection_count`
  - `-db_max_idle_connection_count`
  - `-snapshot_hydrate_stores`
  - `-enable_h2_console`

Full release notes are available in the release
[CHANGELOG](https://gitbox.apache.org/repos/asf?p=aurora.git&f=CHANGELOG&hb=rel/0.19.0).

## Thanks

Thanks to the 14 contributors who made Apache Aurora 0.19.0 possible:

* Bill Farner
* David McLaughlin
* Derek Slager
* Jordan Ly
* Kai Huang
* Keisuke Nishimoto
* Mauricio Garavaglia
* Renan DelValle
* Reza Motamedi
* Robert Allen
* Ruben D. Porras
* Santhosh Kumar Shanmugham
* Stephan Erb
* Zameer Manji






