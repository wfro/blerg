require_relative 'feature_test_helper'

class BlogArchiveTest < FeatureTest
  def test_it_displays_a_list_of_all_posts
    visit '/'
    click_link 'archive'
    assert page.has_css? '.archive-container'
  end
end
