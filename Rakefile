##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
$DEBUG = false
$VERBOSE = false
require 'rake/testtask'
require 'rubocop/rake_task'

desc 'Run all tests'
task :all do
  puts 'Running unit tests'
  Rake::Task['unit'].invoke
  puts 'Running integration tests'
  Rake::Task['integration'].invoke
end

task :default => :unit

Rake::TestTask.new(:unit) do |t|
  t.description = 'Run unit tests'
  t.test_files = FileList['test/enable_coverage.rb', 'test/unit/test_*.rb']
  t.verbose = true
end

Rake::TestTask.new(:integration) do |t|
  t.description = 'Run integration tests'
  t.test_files = FileList['test/integration.rb']
end

desc 'Run bundle-audit'
task :bundle_audit do
  Rake::Task['bundle_audit:update'].invoke
  Rake::Task['bundle_audit:check'].invoke
end

desc 'Generate documentation to doc/rdocs/index.html'
task :rdoc do
  Rake::Task['rdoc:rerdoc'].invoke
end

RuboCop::RakeTask.new

############################################################
# rdoc
############################################################
namespace :rdoc do
  require 'rdoc/task'

  desc 'Generate documentation to doc/rdocs/index.html'
  Rake::RDocTask.new do |rd|
    rd.title = 'WhatWeb'
    rd.rdoc_dir = 'doc/rdocs'
    rd.main = 'README.md'
    rd.rdoc_files.include(
      'whatweb',
      'lib/**/*\.rb')
    rd.options << '--line-numbers'
    rd.options << '--all'
  end
end

############################################################
# bundle-audit
############################################################
namespace :bundle_audit do
  require 'bundler/audit/cli'

  desc 'Update bundle-audit database'
  task :update do
    Bundler::Audit::CLI.new.update
  end

  desc 'Check gems for vulns using bundle-audit'
  task :check do
    Bundler::Audit::CLI.new.check
  end
end

