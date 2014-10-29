require_relative 'feature_test_helper'
require 'capybara'

class StaticPagesTest < FeatureTest
  def test_navbar_links_go_to_the_right_places
    visit '/'
    assert page.has_link? 'home'
    assert page.has_link? 'about'
    assert page.has_link? 'github'
    assert page.has_link? 'twitter'
  end
end
