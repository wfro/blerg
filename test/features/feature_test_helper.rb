require_relative '../test_helper'
require_relative '../../app'
require 'capybara'


Capybara.app = BlergApp

class FeatureTest < Minitest::Test
  include Capybara::DSL

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
