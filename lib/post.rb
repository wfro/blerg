class Post
  attr_reader :title, :tags, :published_at

  def initialize(title: '', tags: '', published_at: nil)
    @title = title
    @tags  = tags.split(', ')
    set_published_timestamp(published_at)
  end

  private

  # posts shouldn't be valid without a timestamp as we'd have no
  # way to reliably sort them for the front page
  def set_published_timestamp(published_at)
    if published_at.nil?
      raise ArgumentError, 'You must provide a timestamp (Time.now) when creating a post.'
    end
    @published_at = published_at
  end
end
