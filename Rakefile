require 'bundler/setup'
require 'bundler/gem_tasks'
require 'rake/testtask'
require 'yard'

YARD::Rake::YardocTask.new(:yard) do |t|
  t.stats_options = ['--list-undoc']
end

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task default: :test
