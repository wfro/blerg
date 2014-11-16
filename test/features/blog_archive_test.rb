require_relative 'feature_test_helper'

class BlogArchiveTest < FeatureTest
  def test_it_displays_a_list_of_all_posts
    post = Post.new(filename: "2014-10-27-gems-for-debugging-and-testing", 
                    published_at: Time.now)
    post.save
    
    visit '/'
    click_link 'archive'
    assert page.has_css? '.archive-container'
  end
end
