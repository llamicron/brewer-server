require "bundler/setup"
require 'rack/test'
require 'rspec'
require_relative "../lib/brewer/server"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

module RSpecMixin
  include Rack::Test::Methods
  def app() Brewer::Server end
end

RSpec.configure { |c| c.include RSpecMixin }
