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

  spec.files = Dir['lib/**/*', 'LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'rails', '>= 5.0.0.beta'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'minitest', '~> 5.11'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 0.76'
  spec.add_development_dependency 'simplecov', '~> 0.17'
  spec.add_development_dependency 'sqlite3', '~> 1.4'
end
