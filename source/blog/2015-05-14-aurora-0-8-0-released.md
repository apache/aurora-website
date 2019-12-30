---
layout: post
title: 0.8.0 Released
permalink: /blog/aurora-0-8-0-released/
published: true
post_author:
  display_name: Jake Farrell
  twitter: eatfresh
tags: Release
---

The latest Apache Aurora release, 0.8.0, is now available for [download](http://aurora.apache.org/downloads/). This version marks the first Aurora release since becoming a top-level project at the Apache Software Foundation, and includes the following features, improvements, and announcements:

* Added support for external update coordination
* Security for scheduler operations, using Apache Shiro
* Scheduler performance improvements
* 0.8.0 deprecations

Full release notes are available in the release [CHANGELOG](https://gitbox.apache.org/repos/asf?p=aurora.git&f=CHANGELOG&hb=refs/tags/rel/0.8.0).

## Support for external update coordination

With the introduction of scheduler-driven job update orchestration, Aurora now optionally supports an inverted dependency model where the updater can willingly pause job update progress upon reaching certain checkpoints and wait for the client/external service to explicitly "ack" on it. Further details are outlined in the [coordinated job updates](http://aurora.apache.org/documentation/0.8.0/client-commands/#coordinated-job-updates) documentation.

This feature may also be useful for building external update coordination services where Aurora service job upgrades are controlled by application specific health tracking systems, throttling individual job updates based on the internal health/traffic metrics.

## Security for scheduler operations, using Apache Shiro

Aurora now uses [Apache Shiro](http://shiro.apache.org) to manage security for scheduler operations, including authenticated write access (HTTP Basic Auth or Kerberos), and fine-grained ACLs for scheduler RPCs.

Further details are outlined in the [security documentation](http://aurora.apache.org/documentation/0.8.0/security/).

## Scheduler performance improvements

Performance is continually an area of focus and improvement for the Aurora team, with production Aurora clusters measuring tens of thousands of machines and tens-to-hundreds of thousands of tasks. Two specific [scheduler performance improvements](https://issues.apache.org/jira/browse/AURORA-999) were a focus of the 0.8.0 release, including [improved preemption efficiency](https://issues.apache.org/jira/browse/AURORA-1219), and creating a [scheduler performance benchmark framework](https://issues.apache.org/jira/browse/AURORA-969).

## 0.8.0 deprecations

The latest Aurora release includes the [several removals and deprecations](https://issues.apache.org/jira/browse/AURORA-905), including:

* [AURORA-975](https://issues.apache.org/jira/browse/AURORA-975), Removing populatedDEPRECATED from PopulateJobResult
* [AURORA-1190](https://issues.apache.org/jira/browse/AURORA-1190), Added a deprecation warning when the client-side updater is used; will be removed in 0.9.0
* [AURORA-1240](https://issues.apache.org/jira/browse/AURORA-1240), Added a deprecation warning for restart_theshold setting
* [AURORA-1189](https://issues.apache.org/jira/browse/AURORA-1189), Added a warning in the scheduler when the JVM version is < 1.8
* Removal of the custom security API in favor of integration with Apache Shiro

## Getting Involved

We encourage you to try out this release and let us know what you think. If you run into any issues, please let us know on the [user mailing list and IRC](https://aurora.apache.org/community/). The community also holds weekly IRC meetings at 11AM Pacific every Monday that you are welcome to join.

## Thanks

Thanks to the 21 contributors who made Apache Aurora 0.8.0 possible:

* Ben Mahler
* Bhuvan Arumugam
* Bill Farner
* Brian Brazil
* Brian Wickman
* Dave Lester
* David Robinson
* Florian Pfeiffer
* Jake Farrell
* Joe Smith
* Joshua Cohen
* Kevin Sweeney
* Maxim Khutornenko
* Ricardo Cervera-Navarro
* Sanyogeeta Lawande
* Stephan Erb
* Steve Niemitz
* Thorhallur Sverrisson
* Tony Dong
* Zameer Manji
* Zeke Harris
