# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'snip_snip/version'

Gem::Specification.new do |spec|
  spec.name        = 'snip_snip'
  spec.version     = SnipSnip::VERSION
  spec.authors     = ['Kevin Deisz']
  spec.email       = ['kevin.deisz@gmail.com']
  spec.homepage    = 'https://github.com/kddeisz/snip_snip'
  spec.summary     = 'SnipSnip cuts the deadweight'
  spec.description = "Lets you know what you selected that you shouldn't have"
  spec.license     = 'MIT'

  spec.files = Dir['lib/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'rails', '>= 5.0.0.beta'

  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'yard'
end
