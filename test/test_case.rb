ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "benchmark"

module Feature
  # Feature tests work at the HTTP request/response level, passing requests to the application and
  # testing responses. Feature tests should be detailed and isolated. Test one thing at once and aim
  # to test all scenarios.
  class TestCase < ActionDispatch::IntegrationTest
    def get_uncached path
      ActionController::Base.view_paths.map(&:clear_cache)
      get path
    end
  end
end