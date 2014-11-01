require_relative 'test_helper'
require_relative '../lib/post'

class PostTest < Minitest::Test
  def test_it_saves_attributes_correctly
    post = Post.new(title: "Breaking: Jon Snow Knows Nothing",
                    tags: "got, the wall",
                    published_at: Time.now)
    assert_equal "Breaking: Jon Snow Knows Nothing", post.title
    assert_equal ["got", "the wall"], post.tags
    assert_respond_to post, 'published_at'
  end

  def test_not_having_published_at_raises_argument_error
    assert_raises(ArgumentError) do
      Post.new(title: "Breaking: Jon Snow Knows Nothing",
               tags: "got, the wall")
    end
  end
end

