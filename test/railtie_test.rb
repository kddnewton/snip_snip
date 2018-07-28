# frozen_string_literal: true

require 'test_helper'

module SnipSnip
  class RailtieTest < ActiveSupport::TestCase
    test 'controller callback loaded' do
      refute_empty Class.new(ActionController::Base)._process_action_callbacks
    end

    test 'model callback loaded' do
      refute_empty Class.new(ActiveRecord::Base)._find_callbacks
    end
  end
end
