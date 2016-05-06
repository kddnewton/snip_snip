# frozen_string_literal: true
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'snip_snip/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'snip_snip'
  s.version     = SnipSnip::VERSION
  s.authors     = ['Kevin Deisz']
  s.email       = ['kevin.deisz@gmail.com']
  s.homepage    = 'https://github.com/kddeisz/snip_snip'
  s.summary     = 'SnipSnip cuts the deadweight'
  s.description = "Lets you know what you selected that you shouldn't have"
  s.license     = 'MIT'

  s.files = Dir['lib/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '>= 5.0.0.beta4', '< 5.1'

  s.add_development_dependency 'coveralls'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
