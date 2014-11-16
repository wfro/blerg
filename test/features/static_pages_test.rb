require_relative 'feature_test_helper'
require 'capybara'

class StaticPagesTest < FeatureTest
  def setup
    post = Post.new(filename: "2014-10-27-gems-for-debugging-and-testing", 
                    published_at: Time.now)
    post.save
  end

  def test_navbar_links
    visit '/'
    assert page.has_link? 'blog'
    assert page.has_link? 'archive'
    assert page.has_link? 'about'
    assert page.has_link? 'github'
    assert page.has_link? 'twitter'
  end

  def test_about_page_has_some_stuff
    visit '/'
    click_link 'about'
    assert page.has_css? '.about'
  end
end
