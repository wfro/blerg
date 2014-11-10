require 'yaml/store'

class Post
  attr_reader :title, :tags, :published_at, :filename

  def initialize(title: '', tags: '', published_at: nil, filename: nil)
    @title = title
    @tags  = tags
    set_filename(filename)
    set_published_timestamp(published_at)
  end

  def self.database(file_path = 'manifest')
    @database ||= YAML::Store.new file_path
  end

  def database
    Post.database
  end

  def save
    database.transaction do |db|
      db['posts'] ||= []
      db['posts'] << {
        title: title,
        tags: tags,
        published_at: published_at,
        filename: filename
      }
    end
  end

  def self.all
    posts = database.transaction do |db|
      db['posts'] || []
    end
    posts.map do |post|
      Post.new(title: post[:title],
               tags: post[:tags],
               filename: post[:filename],
               published_at: post[:published_at])
    end
  end

  def self.last
    all.last
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

  # filenames will be read and passed to the markdown parser, so we
  # need to validate them
  def set_filename(filename)
    if filename.nil?
      raise ArgumentError, 'Provide a filename for your post.'
    else
      @filename = filename
    end
  end
end
