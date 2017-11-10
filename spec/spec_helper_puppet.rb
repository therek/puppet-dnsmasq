$executing_puppet = true

require 'spec_helper'
require 'rspec-puppet-facts'

include RspecPuppetFacts

at_exit { RSpec::Puppet::Coverage.report! }
