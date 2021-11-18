# frozen_string_literal: true

require_relative 'lib/snip_snip/version'

version = SnipSnip::VERSION
repository = 'https://github.com/kddnewton/snip_snip'

Gem::Specification.new do |spec|
  spec.name        = 'snip_snip'
  spec.version     = version
  spec.authors     = ['Kevin Newton']
  spec.email       = ['kddnewton@gmail.com']

  spec.homepage    = repository
  spec.summary     = 'SnipSnip cuts the deadweight'
  spec.description = "Lets you know what you selected that you shouldn't have"
  spec.license     = 'MIT'

  spec.files = Dir['lib/**/*', 'LICENSE', 'Rakefile', 'README.md']
  spec.metadata = {
    'bug_tracker_uri' => "#{repository}/issues",
    'changelog_uri' => "#{repository}/blob/v#{version}/CHANGELOG.md",
    'source_code_uri' => repository,
    'rubygems_mfa_required' => 'true'
  }

  spec.add_dependency 'rails', '>= 5.0.0.beta'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'minitest', '~> 5.11'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 1.12'
  spec.add_development_dependency 'simplecov', '~> 0.17'
  spec.add_development_dependency 'sqlite3', '~> 1.4'
end
