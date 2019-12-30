---
layout: post
title: 0.10.0 Released
permalink: /blog/aurora-0-10-0-released/
published: true
post_author:
  display_name: Bill Farner
  twitter: wfarner
tags: Release
---

The latest Apache Aurora release, 0.10.0, is now available for
[download](http://aurora.apache.org/downloads/). Here are some highlights in this release:

* Upgraded Mesos to 0.23.0. Note: the Aurora executor now requires openssl runtime dependencies that
  were not previously required. You will need libcurl available on every Mesos slave (or Docker
  container) to successfully launch the Aurora executor. See
  https://github.com/apache/mesos/blob/ebcf8cc2f2f6c236f6e9315447c247e6348141e1/docs/getting-started.md
  for more details on Mesos runtime dependencies.
* Resource quota is no longer consumed by production jobs with a dedicated constraint (AURORA-1457).
* In the scheduler API, the `ConfigGroup.instanceIds` field has been deprecated, please use
  `ConfigGroup.instances` instead.
* In the scheduler API, all `SessionKey` arguments are now ignored by the scheduler as it has been
  replaced by [security features](/documentation/0.10.0/security/) added in 0.8.0.
* The `--root` argument has been removed from the Thermos observer.

Full release notes are available in the release [CHANGELOG](https://gitbox.apache.org/repos/asf?p=aurora.git&f=CHANGELOG&hb=refs/tags/rel/0.10.0).


## Getting Involved

We encourage you to try out this release and let us know what you think. If you run into any issues, please let us know on the [user mailing list and IRC](https://aurora.apache.org/community/). The community also holds weekly IRC meetings at 11AM Pacific every Monday that you are welcome to join.

## Thanks

Thanks to the 19 contributors who made Apache Aurora 0.10.0 possible:

* Andrew Jorgensen
* Bill Farner
* Brian Brazil
* David Robinson
* Dmitriy Shirchenko
* Jake Farrell
* Jeffrey Schroeder
* Joe Smith
* John Sirois
* Joshua Cohen
* Kevin Sweeney
* Mauricio Garavaglia
* Maxim Khutornenko
* Stephan Erb
* Steve Niemitz
* Thorhallur Sverrisson
* Zameer Manji
* Zane Silver
* Jake Farrell
