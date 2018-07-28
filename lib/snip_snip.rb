# frozen_string_literal: true

require 'logger'

require 'snip_snip/filter'
require 'snip_snip/railtie'
require 'snip_snip/registry'
require 'snip_snip/reporter'

# Top-level wrapper module.
module SnipSnip
  # The logger object used to report unused columns.
  def self.logger
    @logger ||= Logger.new(Rails.root.join('log', 'snip-snip.log'))
  end
end
