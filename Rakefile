require 'fileutils'
require 'rake/clean'
require 'rubygems'
require 'set'
require 'yaml'

task :default => [:build, :clean]
 
CLEAN.include '**/.DS_Store'

def list_release_dirs()
  Dir.chdir('source/documentation') {
    dirs = Dir.glob('*')
    dirs.delete('latest')
    dirs
  }
end

def downloads_sanity_check()
  releases_file = 'data/downloads.yml'

  releases = []
  YAML.load_file(releases_file)['releases'].each do |release|
    releases << release['version']
  end

  if releases.detect{ |e| releases.count(e) > 1 }
    puts "#{releases_file} contains a duplicate release version"
    exit 2
  end

  release_dirs = list_release_dirs()
  if releases.uniq.sort != release_dirs.uniq.sort
    puts 'Listed releases does not match release dirs!'
    puts "Releases in #{releases_file}: #{releases}"
    puts "Release dirs: #{release_dirs}"
    exit 2
  end
end

desc 'Build the website from source'
task :build do
  downloads_sanity_check()

  puts 'Building website from static source'
  result = system('middleman build --clean')
  if result 
    puts 'Successfully generated the site, please commit your changes'
  else
    puts 'An error was encountered when generating the site'
  end
end

desc 'Fetch markdown from the source tree and generate docs for a specific git tag.'
task :generate_docs, [:title, :git_tag] do |t, args|
  if !args[:title] or !args[:git_tag]
    puts args, 'Usage: generate_docs[TITLE, GIT_TAG]'
    exit 1
  end

  title = args[:title]
  git_tag = args[:git_tag]

  puts "Generating docs from git tag #{git_tag} with title #{title}"

  tmp_dir = File.join(File.dirname(__FILE__), 'tmp')
  #Rake::Task[:clean].invoke if File.exist?(tmp_dir)

  FileUtils.mkdir_p(tmp_dir)
  
  zip_name = "#{git_tag}.zip"
  is_master = ['master', 'HEAD'].include? git_tag
  archive_root = if is_master then "aurora-#{git_tag}" else "aurora-rel-#{git_tag}" end
  archive_rel_url = if is_master then zip_name else "rel/#{zip_name}" end
  full_tag = if is_master then git_tag else "rel/#{git_tag}" end

  Dir.chdir(tmp_dir) {
    if File.exist?(zip_name) and not is_master
      puts 'Skipping archive fetch'
    else
      puts "Fetching archive of #{git_tag}"
      system("wget https://github.com/apache/aurora/archive/#{archive_rel_url} -O #{zip_name}")
    end
    system("unzip -o #{zip_name} '#{archive_root}/docs/*' '#{archive_root}/CONTRIBUTING.md'")
    FileUtils.mv(File.join(archive_root, 'CONTRIBUTING.md'), File.join(archive_root, 'docs/CONTRIBUTING.md'))
  }

  docs_in_dir = File.join(tmp_dir, archive_root, 'docs')
  docs_out_dir = File.join('source', 'documentation', title)
  FileUtils.rm_f(docs_out_dir)
  FileUtils.mkdir_p(docs_out_dir)

  FileUtils.cp_r(Dir.glob(File.join(docs_in_dir, '*')), docs_out_dir)

  puts 'Translating documentation'
  Dir.chdir(docs_out_dir) {
    FileUtils.mv('README.md', 'index.html.md')

    # Rename the contributing page to lower case.  This doesn't exist in all releases, so we
    # check first if it exists.
    contributing_doc = 'CONTRIBUTING.md'
    if File.exist?(contributing_doc)
      File.rename(contributing_doc, contributing_doc.downcase)
    end

    Dir.glob('**/*.md').each { |doc|
      puts "working on: #{doc}"

      # Hacks to make markdown intended for GitHub work.
      IO.write(doc, File.open(doc, :encoding => 'utf-8') { |f|
        # Add an extra .. to account for middleman s/page/dir/ for a link in any page except the top-level index.
        rel_prefix = if File.dirname(f.path) == "." then "" else "../" end

        f.read.
            # Rewrite links to '../CONTRIBUTING.md'.
            gsub(/\.\.\/CONTRIBUTING\.md/, 'contributing/').
            
            # Rewrite source links pointing to source files in the repository.
            gsub(/\]\((?:\.\.\/)+([^\)]+\.(?:java|py|js|thrift|xml|json|conf))\)/, "](https://github.com/apache/aurora/blob/#{full_tag}/\\1)").
            
            # For relative links, remove .md extension (We have no absolute links and we do not try to handle those here).
            gsub(/\(((?:[._A-Za-z0-9-]+\/)*[_A-Za-z0-9-]+)\.md(#[^\)]+)?\)/, "(#{rel_prefix}\\1/\\2)").

            # Fix anchor links and names, which GitHub prefixes with 'user-content-'
            # See AURORA-726.
            gsub(/#user-content\-/, '#').

            # Fix image links.  This is necessary because middleman turns each markdown page
            # into a directory name.  During this process, relative image tags in HTML are not
            # adjusted accordingly.
            gsub(/img src="images\//, "img src=\"/documentation/#{title}/images/").
            # In a similar fashion, fix HTML links in our presentation list
            gsub(/img src="\.\.\/images\//, "img src=\"/documentation/#{title}/images/")

      })
    }
  }
end

desc 'Run the site in development mode. Preview available at http://localhost:4567/'
task :dev do
  system('middleman server')
end
