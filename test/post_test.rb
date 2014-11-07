require_relative 'test_helper'
require_relative '../lib/post'

class PostTest < Minitest::Test
  def setup
    Post.database 'test/fixtures/manifest'
  end

  def teardown
    File.open('./test/fixtures/manifest', 'w') { |file| file.truncate(0) }
  end

  def test_it_saves_attributes_correctly
    time = Time.now
    post = Post.new(title: 'Breaking: Jon Snow Knows Nothing',
                    tags: 'got, the wall',
                    published_at: time)
    assert_equal 'Breaking: Jon Snow Knows Nothing', post.title
    assert_equal 'got, the wall', post.tags
    assert_equal time, post.published_at
  end

  def test_not_having_published_at_raises_an_argument_error
    assert_raises(ArgumentError) do
      Post.new(title: "Breaking: Jon Snow Knows Nothing",
               tags: "got, the wall")
    end
  end

  def test_it_has_a_data_store_instance
    assert_instance_of Psych::Store, Post.database
  end
end

