---
layout: post
title: 0.6.0-incubating Released
permalink: /blog/aurora-0-6-0-incubating-released/
published: true
post_author:
  display_name: Bill Farner
  twitter: wfarner
tags: Release
---

The latest Apache Aurora release, 0.6.0-incubating, is now available for download. This version marks the second Aurora release since becoming part of the [Apache Incubator](http://incubator.apache.org), and includes the following features and improvements:

 * Introduced highly-available, scheduler-driven job updates in beta ([AURORA-610](https://issues.apache.org/jira/browse/AURORA-610))
 * Improvements to the Aurora web UI, including visualization of job updates
 * Added automatic service registration in ZooKeeper ([AURORA-587](https://issues.apache.org/jira/browse/AURORA-587))
 * Updates to Aurora client version two, deprecation of v1 coming in future release
 * Lots of new  [documentation](http://aurora.apache.org/documentation/0.6.0-incubating/). Documentation now includes pages for [deploying the Aurora scheduler](http://aurora.apache.org/documentation/0.6.0-incubating/deploying-aurora-scheduler/), [cron jobs](http://aurora.apache.org/documentation/0.6.0-incubating/cron-jobs/), [SLA measurement](http://aurora.apache.org/documentation/0.6.0-incubating/sla/), [storage](http://aurora.apache.org/documentation/0.6.0-incubating/storage/), and [storage configuration and measurement](http://aurora.apache.org/documentation/0.6.0-incubating/storage-config/).

Full release notes are available in the release [CHANGELOG](https://gitbox.apache.org/repos/asf?p=aurora.git&f=CHANGELOG&hb=refs/tags/rel/0.6.0-incubating).

## Highly-available, scheduler-driven updates
Rolling updates of services is a crucial feature in Aurora. As such, we
want to take great care when changing its behavior. Previously, Aurora operated
by delegating this functionality to the client (or any API client, for that
matter). In this version, the scheduler can take over the
responsibility of application update orchestration. Further details were discussed on the [Aurora mailing list](http://mail-archives.apache.org/mod_mbox/aurora-dev/201407.mbox/%3CCAGRA8uMxwVDokp_iHXhNru2gd-x_nM%2BDYAurpfAO6wuX7%3DnHFw%40mail.gmail.com%3E).

## Aurora Web UI Improvements
Since the scheduler can now orchestrate job updates, it has awareness of the progress and outcome of updates.  This means you can see a progress bar for in-flight updates, and the history of updates for your jobs.  Additionally, the performance of the UI was improved, especially for large roles and jobs [AURORA-458](https://issues.apache.org/jira/browse/AURORA-458).

## Service Announcement and Management
Job configurations can now supply an [`announce` parameter](http://aurora.apache.org/documentation/0.6.0-incubating/configuration-reference/#announcer-objects), which is meant to be a way to opt-in for registration in a service discovery system. This has been implemented in the Aurora executor, and will automatically announce tasks via ZooKeeper.

## Aurora Client Improvements
Progress was made in features to v2 of the [Aurora client](http://aurora.apache.org/documentation/0.6.0-incubating/client-commands/). We will support version 1 and version 2 for 0.6.0, with version 1 to be removed in 0.7.0.

## Improved Project Documentation
New documentation pages including:

 * [Deploying the Aurora scheduler](http://aurora.apache.org/documentation/0.6.0-incubating/deploying-aurora-scheduler/)
 * [Cron jobs](http://aurora.apache.org/documentation/0.6.0-incubating/cron-jobs/)
 * [SLA measurement](http://aurora.apache.org/documentation/0.6.0-incubating/sla/)
 * [Storage](http://aurora.apache.org/documentation/0.6.0-incubating/storage/)
 * [Storage configuration and measurement](http://aurora.apache.org/documentation/0.6.0-incubating/storage-config/)
 * [Monitoring](http://aurora.apache.org/documentation/0.6.0-incubating/monitoring/)

## Getting Involved
We encourage you to try out this release and let us know what you think. If you run into any issues, please let us know on the [user mailing list and IRC](https://aurora.apache.org/community). The community also holds weekly IRC meetings at 11AM Pacific every Monday that you are welcome to join.

## Thanks
Thanks to the 16 contributors who made 0.6.0-incubating possible:

* Bill Farner
* Maxim Khutornenko
* Kevin Sweeney
* Mark Chu-Carroll
* Joshua Cohen
* Zameer Manji
* David McLaughlin
* Brian Wickman
* Joe Smith
* Jake Farrell
* Matthew Jeffryes
* Dominic Hamon
* Bjoern Metzdorf
* Joseph Glanville
* David Robinson
* David Pan
