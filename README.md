# Apache Aurora Website
This will generate the Apache Aurora available at http://aurora.apache.org. The content
within the publish folder will be the actual deployed site.


## Setup

		gem install bundler
		bundle install
		

## Generating the site
To generate the site one only needs to run `rake` after performing the setup
tasks mentioned above. This will download the latest Apache Aurora documentation
contained in the `docs` folder, integrate them into the site, and generate all
other files within the source folder.

		rake


## Development 
To live edit the site run `rake dev` and then open a browser window to 
http://localhost:4567/ . Any change you make to the sources dir will 
be shown on the local dev site immediately. Errors will be shown in the 
console you launched `rake dev` within.


## Other available tasks

		rake build        # Build the website from source
		rake clean        # Remove any temporary products
		rake clobber      # Remove any generated file
		rake dev          # Run the site in development mode
		rake update_docs  # Update the latest docs from the Apache Aurora codebase


## Publishing the Site
The website uses svnpubsub. The publish folder contains the websites content
and when committed to the svn repository it will be automatically deployed to 
the live site. 


### Apache License
Except as otherwise noted this software is licensed under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0.html)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.