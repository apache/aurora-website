# Apache Aurora Website
This codebase generates the Apache Aurora available at
[http://aurora.apache.org](http://aurora.apache.org).

Community contributions and patches are welcomed to help keep the Aurora site up-to-date;
please see the section below on contributing website changes or feel free to ask questions
on the Aurora IRC channel, #aurora on Freenode.net.

## Website Basics
### Middleman CMS
The Aurora website is powered by [Middleman](http://middlemanapp.com/), a static website generator
written in ruby. If you'd like to learn more about Middleman and how it works, their official
websites have helpful documentation.

## Setup
For most website-related changes, knowledge of Middleman or Ruby are unnecessary; Middleman is
used to convert markdown files to HTML and handle dynamic templates.

### Directory Structure
The website has three sub-directories:

 * `source/`, which includes site templates and markdown files. This is the directory you will
   revise documents in 99% of the time.
 * `content/`, where static-generated HTML files app live. Files in this directory are generated
   when the `rake2.0 build` command is run, and these files are served via HTTP on the Aurora
   website.
 * `tmp/`, a directory used when cloning the remote project repository before processing
   documentation and other files.

The main directory includes a Rakefile, which will be used to run commands related to building and
testing the website during development. More info below.

## Running and Developing the Website

### Setting up Local Dev Environment using Docker
From the root of the repository run the following:

$ docker run -it -v $(pwd):/website -p 4567:4567 apache/aurora-website:dev

Execute the remainder of the commands inside of this docker container.

### Generating the site
To generate the site one only needs to run `rake2.0` after performing the setup
tasks mentioned above. This will download the latest Apache Aurora documentation
contained in the `docs` folder, integrate them into the site, and generate all
other files within the source folder.

    rake2.0

### Other available tasks

    rake2.0 build         # Build the website from source
    rake2.0 clean         # Remove any temporary products
    rake2.0 clobber       # Remove any generated file
    rake2.0 dev           # Run the site in development mode
    rake2.0 generate_docs # Fetch documentation from git for rendering.

### Generating documentation pages from git
The majority of our documentation currently lives in git as markdown.  The `generate_docs`
task automates the process of fetching the markdown, performing some translations, and
storing it in a version-specific directory under `source/documentation`.

You will use the `generate_docs` rake task to fetch the docs you wish to place on the website.
This task takes two arguments - `title` and `git_tag`.  The title is the name to give this branch
of documentation.

#### Updating documentation to match git master
If a documentation patch is contributed and you would like to update the website to reflect
it, you will be updating the documentation for `latest`.
Note: since documentation is associated with versions, be careful to avoid publishing
misleading documentation for unreleased featuresl

    # This will fetch the docs and place them in `source/documentation/latest`.
    rake2.0 generate_docs[latest,master]

    # Render the docs.
    rake2.0

#### Updating the documentation for a release.
After completing an official Aurora release, you should add the new version of documentation and
advertise the release on the website.

$RELEASE in this case is the number version of the release (i.e. 0.22.0).

First, add the new release to the top of `data/downloads.yml`.

    # Add documentation for the new release
    rake2.0 generate_docs[$RELEASE,$RELEASE]

    # Update the `latest` release docs
    rake2.0 generate_docs[latest,$RELEASE]

    # Render the docs.
    rake2.0

### Development
To live edit the site run `rake2.0 dev` and then open a browser window to
`http://localhost:4567`. Any change you make to the sources dir will
be shown on the local dev site immediately. Errors will be shown in the
console you launched `rake2.0 dev` within.

## Contributing Website Changes
Have you made local changes that you would like to contribute to the website?
Make a PR to our website repository through Github.

## Publishing Changes to the Website
All project committers have access to commit to the Aurora website; we encourage those without
commit access to contribute changes by following the steps above.

The website uses Apache Infra tooling to sync this Git repository with the live site.

The content folder contains the websites content and when changes are committed to the asf-staging
or asf-site branches, changes will be automatically deployed.

Before committing ensure that changes from source/ have been properly built in the `content/`
directory.

`$ git add content source`
`$ git commit -m "Message describing the website changes you've made."`

Updates to the current website should first be submitted as a Pull Request to the asf-staging branch.

Once the PR has been merged in the asf-staging branch, a live preview will be available at:
https://aurora.staged.apache.org/

If the site looks good and functions correctly, a PR should be made to the asf-site branch
from the asf-staging branch, squashing all commits into a single commit detailing
the change (usually a release).

Note: there is sometimes a slight delay between merging PRs and
changes appearing online.

### Apache License
Except as otherwise noted this software is licensed under the
[Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0.html)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
