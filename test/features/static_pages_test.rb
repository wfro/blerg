require_relative 'feature_test_helper'
require 'capybara'

class StaticPagesTest < FeatureTest
  def test_navbar_links
    visit '/'
    assert page.has_link? 'home'
    assert page.has_link? 'about'
    assert page.has_link? 'github'
    assert page.has_link? 'twitter'
  end

  def test_about_page_has_some_stuff
    skip
    visit '/'
    click_link 'about'
    assert page.has_css? '.about', text: 'developer'
  end
end
