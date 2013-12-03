# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"
require "rails_admin_data_quality"

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }


# Load fixtures from the engine
if ActionController::TestCase.method_defined?(:fixture_path=)
  ActionController::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
end


ActionDispatch::IntegrationTest.fixture_path = File.expand_path("../fixtures", __FILE__)


class ActiveSupport::TestCase
  fixtures :all
end
