# frozen_string_literal: true

APP_RAKEFILE = File.expand_path('test/dummy/Rakefile', __dir__)
load 'rails/tasks/engine.rake'
load 'rails/tasks/statistics.rake'

require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.warning = nil
end

task default: :test
