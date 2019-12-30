---
layout: post
title: 0.9.0 Released
permalink: /blog/aurora-0-9-0-released/
published: true
post_author:
  display_name: Jake Farrell
  twitter: eatfresh
tags: Release
---

The latest Apache Aurora release, 0.9.0, is now available for [download](http://aurora.apache.org/downloads/). This version includes many new features and improvements including:

* Now requires JRE 8 or greater.
* GC executor is fully replaced by the task state reconciliation (AURORA-1047).
* The scheduler command line argument 'enable_legacy_constraints' has been
  removed, and the scheduler no longer automatically injects 'host' and 'rack'
  constraints for production services. (AURORA-1074)
* SLA metrics for non-production jobs have been disabled by default. They can
  be enabled via the scheduler command line. Metric names have changed from
  '...nonprod_ms' to "...ms_nonprod" (AURORA-1350).

Full release notes are available in the release [CHANGELOG](https://gitbox.apache.org/repos/asf?p=aurora.git&f=CHANGELOG&hb=refs/tags/rel/0.9.0).


## 0.9.0 deprecations

The latest Aurora release includes the [several removals and deprecations](https://issues.apache.org/jira/browse/AURORA-1079), including:

* AURORA-1074 - Remove the "enable_legacy_constraints" flag.
* AURORA-1139 - Remove backwards compatibility shims from JobUpdateKey introduction


## Getting Involved

We encourage you to try out this release and let us know what you think. If you run into any issues, please let us know on the [user mailing list and IRC](https://aurora.apache.org/community/). The community also holds weekly IRC meetings at 11AM Pacific every Monday that you are welcome to join.

## Thanks

Thanks to the 18 contributors who made Apache Aurora 0.9.0 possible:

* Bill Farner
* Jake Farrell
* Kevin Sweeney
* Joe Smith
* Andrew Jorgensen
* Steve Salevan
* Brian Wickman
* Brian Brazil
* Stephan Erb
* Zameer Manji
* Maxim Khutornenko
* David McLaughlin
* Michael Leinartas
* Benjamin Staffin
* Dave Lester
* Jeffrey Schroeder
* Will Swank
* Ben Mahler
