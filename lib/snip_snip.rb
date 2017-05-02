# frozen_string_literal: true

require 'forwardable'
require 'logger'

require 'snip_snip/filter'
require 'snip_snip/railtie'
require 'snip_snip/registry'
require 'snip_snip/reporter'

module SnipSnip
  def self.logger
    @logger ||= Logger.new(Rails.root.join('log', 'snip-snip.log'))
  end
end
