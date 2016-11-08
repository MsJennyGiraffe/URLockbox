# ENV['RAILS_ENV'] ||= 'test'
# require File.expand_path('../../config/environment', __FILE__)
# abort("The Rails environment is running in production mode!") if Rails.env.production?
# require 'spec_helper'
# require 'rspec/rails'
#
#
#
# ActiveRecord::Migration.maintain_test_schema!
#
# RSpec.configure do |config|
#   config.fixture_path = "#{::Rails.root}/spec/fixtures"
#
#   config.use_transactional_fixtures = true
#
#   config.infer_spec_type_from_file_location!
#
#   config.filter_rails_from_backtrace!
# end
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rails'
require 'capybara/rspec'
require 'database_cleaner'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
  config.raise_errors_for_deprecations!
  config.mock_with :rspec
  config.use_transactional_fixtures = false

  config.before(:suite) do
    # Changed this line from :transaction to :truncation
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
