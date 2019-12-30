---
layout: post
title: 0.15.0 Released
permalink: /blog/aurora-0-15-0-released/
published: true
post_author:
  display_name: Maxim Khutornenko
  twitter: hutorrr
tags: Release
---

The latest Apache Aurora release, 0.15.0, is now available for
[download](http://aurora.apache.org/downloads/). The main scope of this release is to catch up 
with Mesos release cadence. As such, no major development or deprecation changes were accepted.
Here are some highlights in this release:

  - New scheduler commandline argument `-enable_mesos_fetcher` to allow job submissions
    to contain URIs which will be passed to the Mesos Fetcher and subsequently downloaded into
    the sandbox. Please note that enabling job submissions to download resources from arbitrary
    URIs may have security implications.
  - Upgraded Mesos to 0.28.2.

Full release notes are available in the release
[CHANGELOG](https://gitbox.apache.org/repos/asf?p=aurora.git&f=CHANGELOG&hb=rel/0.15.0).

## Getting Involved

We encourage you to try out this release and let us know what you think. If you run into any issues,
please let us know on the [user mailing list and IRC](https://aurora.apache.org/community/).

## Thanks

Thanks to the 8 contributors who made Apache Aurora 0.15.0 possible:


* Benjamin Staffin
* John Sirois
* Joshua Cohen
* Martin Hrabovcin
* Maxim Khutornenko
* Mehrdad Nurolahzade
* Renan DelValle
* Stephan Erb
