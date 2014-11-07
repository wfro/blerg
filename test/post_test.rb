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

  def test_it_has_a_psych_store_instance
    assert_instance_of Psych::Store, Post.database
  end

  def test_it_saves_a_post_to_the_manifest
    post = Post.new(title: "A title", tags: "tag1, tag2", published_at: Time.now)
    post.save
    yaml = YAML.load_file 'test/fixtures/manifest'
    assert_equal 'A title', yaml['posts'].first[:title]
  end

  def test_it_has_a_collection_of_post_objects
    3.times { Post.new(title: "A title", tags: "tag1, tag2", published_at: Time.now).save }
    assert_instance_of Array, Post.all
    assert_instance_of Post, Post.all.first
    assert_equal Post.all.first.title, 'A title'
  end

  def test_it_returns_the_most_recent_post
    post = Post.new(title: "A title", tags: "tag1, tag2", published_at: Time.now).save
    post = Post.new(title: "Another title", tags: "tag1, tag2", published_at: Time.now).save
    assert_equal "Another title", Post.last.title
  end
end

