ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Returns true if a test user is logged in.
  # Because helper methods aren’t available
   # in tests, we can’t use the current_user as in Listing 8.18, but the session method
   # is available, so we use that instead.) Here we use is_logged_in? instead of logged_in?
   # so that the test helper and Sessions helper methods have different names,
   # which prevents them from being mistaken for each other.
  def is_logged_in?
    !session[:user_id].nil?
  end
end
