# frozen_string_literal: true

require 'simplecov'
SimpleCov.start do
  enable_coverage :branch
end

# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require File.expand_path('../test/dummy/config/application.rb', __dir__)

Rails.application.initialize!

ActiveRecord::Migration.suppress_messages do
  ActiveRecord::Schema.define do
    create_table :users, force: true do |t|
      t.string :first_name
      t.string :last_name
      t.timestamps
    end
  end
end

User.create!(
  [
    { first_name: 'Pants', last_name: 'King' },
    { first_name: 'Pants', last_name: 'Queen' }
  ]
)

Rails.application.routes.draw do
  get '/action1', to: 'users#action1', as: :action1
  get '/action2', to: 'users#action2', as: :action2
end

require 'rails/test_help'
require 'minitest/mock'

require 'support/logger_double'
ActiveSupport::TestCase.include(
  Module.new do
    def assert_logged(expected)
      old_logger = SnipSnip.logger
      logger_double = LoggerDouble.new

      SnipSnip.instance_variable_set(:@logger, logger_double)
      yield
      assert_equal expected, logger_double.output
    ensure
      SnipSnip.instance_variable_set(:@logger, old_logger)
    end
  end
)

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new
