ENV["RACK_ENV"] = "test"
require "dotenv"
Dotenv.load(".env.test", overwrite: true)
require_relative "../orders/api"
require "rack/test"
require "webmock/rspec"
require "pry"

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into(:webmock)
  config.configure_rspec_metadata!
  config.filter_sensitive_data("<STRIPE_API_KEY>") { ENV["STRIPE_API_KEY"] }
end
