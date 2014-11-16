require_relative '../test_helper'
require_relative '../../lib/app'
require 'capybara'


Capybara.app = BlergApp

class FeatureTest < Minitest::Test
  include Capybara::DSL

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
    File.open('./db/test_manifest', 'w') { |file| file.truncate(0) }
  end
end
