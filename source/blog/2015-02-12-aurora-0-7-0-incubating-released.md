---
layout: post
title: 0.7.0-incubating Released, Adding Support for Docker Containers
permalink: /blog/aurora-0-7-0-incubating-released/
published: true
post_author:
  display_name: Maxim Khutornenko
  twitter: hutorrr
tags: Release
---

The latest Apache Aurora release, 0.7.0-incubating, is now [available for download](http://aurora.apache.org/downloads/). This version marks the third Aurora release since becoming part of the Apache Incubator, and includes the following features, improvements, and announcements:

* Beta support for running Docker containers
* Official support for the Aurora command-line client v2
* Performance improvements for running Aurora at scale
* Progress made toward Apache Incubator graduation

Full release notes are available in the release [CHANGELOG](https://gitbox.apache.org/repos/asf?p=aurora.git&f=CHANGELOG&hb=refs/tags/rel/0.7.0-incubating).


## Docker support within Aurora

Docker has quickly become a popular technology for packaging and managing applications, making it simple to create a snapshot of your app and ship it to different machines in your datacenter. In the Aurora 0.7.0 release, we’ve added a container abstraction that supports Docker out of the box (and potentially future container technologies that may emerge), allowing you to specify a Docker image and schedule it to run within your Aurora cluster.

This feature is marked as experimental in its first release, but we hope to see companies running it in production and helping improve it moving forward. Native Docker support within the Mesos core was added in the [Mesos 0.20.0 release](http://mesos.apache.org/blog/mesos-0-20-0-released/).

## Official support for command-line client v2

Over several releases, Aurora has included a new command-line client version two, rewritten from the ground-up to be simpler and easier to use. In the Aurora 0.7.0 release, we now provide official support for version two of the client, and have fully removed the original version. The previous client version was deprecated in the 0.6.0-incubating release.

We’ve also made the client even-easier to use, by improving the help output that you receive. You can simply type `aurora -h` for a full list of available commands and helpful guidance. We’ve also documented [usage of the client commands](http://aurora.apache.org/documentation/0.7.0-incubating/client-commands/) to provide helpful information about managing jobs.

## Performance Improvements

Performance is continually an area of focus and improvement for the Aurora team, with production Aurora clusters measuring tens of thousands of machines and tens-to-hundreds of thousands of tasks. Two specific improvements were made in this release that make signficant improvements on large clusters, including [AURORA-121](https://issues.apache.org/jira/browse/AURORA-121) which made task pre-emption more efficient, and [AURORA-930](https://issues.apache.org/jira/browse/AURORA-930) which fixed GC performance issues with snapshot deduplication on large clusters.

## Progress toward becoming Top-Level Project

As the Apache Aurora project continues to grow in adopters and contributors, we’ve begun conversations regarding next-steps toward graduating from the Apache Incubator. A graduation resolution is expected to be presented to the Aurora community on the developer mailing list (dev@aurora.apache.org, you can subscribe by emailing dev-subscribe@aurora.apache.org) in the coming weeks and voted on, and hopefully shared with the Apache board shortly after.

## Getting Involved

We encourage you to try out this release and let us know what you think. If you run into any issues, please let us know on the [user mailing list and IRC](https://aurora.apache.org/community). The community also holds weekly IRC meetings at 11AM Pacific every Monday that we encourage you to join. If you're using Aurora, we'd love to hear from you on how to make it better.

## Thanks

Thanks to the 13 contributors who made 0.7.0-incubating possible:

* Bill Farner
* Brian Wickman
* Dave Lester
* David McLaughlin
* Florian Pfeiffer
* Issam EL ATIF
* Jake Farrell
* Jeffrey Schroeder
* Joshua Cohen
* Kevin Sweeney
* Maxim Khutornenko
* Steve Niemitz
* Zameer Manji
