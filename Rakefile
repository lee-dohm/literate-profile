#!/usr/bin/env rake

# 
# Copyright:: Copyright (c) 2012 by Lifted Studios.  All Rights Reserved.
# 

require 'bundler/gem_tasks'
require 'rake/clean'
require 'rake/testtask'
require 'yard'

CLEAN.include('.yardoc')
CLOBBER.include('doc', 'pkg')

task :default => [:test, :yard]

desc "Execute all tests"
task :test => [:ex_check, :spec]

task :ex_check do
  files = Dir.entries('./bin')
  if files.any? { |file| !File.executable?(File.join('./bin', file)) }
    raise "Not all of the files in the bin directory are executable." 
  end
end

Rake::TestTask.new('spec') do |spec|
  spec.libs << 'spec'
  spec.test_files = Dir['spec/**/*_spec.rb']
  spec.warning = true
end

YARD::Rake::YardocTask.new
