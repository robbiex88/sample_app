ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  include ApplicationHelper

end

# Commented below out, replaced with above from hartl book
# essentially this spits colors out to the test terminal window
# making it easier to read

# ENV['RAILS_ENV'] ||= 'test'
# require File.expand_path('../../config/environment', __FILE__)
# require 'rails/test_help'

# class ActiveSupport::TestCase
#   # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
#   fixtures :all

#   # Add more helper methods to be used by all tests here...
# end
