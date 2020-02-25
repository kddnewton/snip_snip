# frozen_string_literal: true

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../../Gemfile', __dir__)

require 'bundler/setup'
$LOAD_PATH.unshift File.expand_path('../../../lib', __dir__)

require 'rails'
require 'active_model/railtie'
require 'active_record/railtie'
require 'rails/test_unit/railtie'

Bundler.require(*Rails.groups)
# require 'snip_snip'

module Dummy
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified
    # here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
