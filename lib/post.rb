require 'yaml/store'

class Post
  attr_reader :title, :tags, :published_at

  def initialize(title: '', tags: '', published_at: nil)
    @title = title
    @tags  = tags
    set_published_timestamp(published_at)
  end

  def self.database(file_path = 'manifest')
    @database ||= YAML::Store.new file_path
  end

  def database
    Post.database
  end

  private

  # posts shouldn't be valid without a timestamp as that's how they'll
  # be sorted usually
  def set_published_timestamp(published_at)
    if published_at.nil?
      raise ArgumentError, 'You must provide a timestamp when creating a post.'
    end
    @published_at = published_at
  end
end
