require 'rake/testtask'
require_relative 'app'

Rake::TestTask.new do |t|
  t.pattern = "test/**/*_test.rb"
end

task :default => [:test]

namespace :post do

  # Right now to add a post to the datastore you'll invoke rake task
  # and pass in the name/value pairs title and tags.
  #   $ rake post:add title="A cool title" tags="such code" filename="post.md"
  task :add do |task, args|
    unless ENV['RACK_ENV']
      ENV['RACK_ENV'] = 'production'
    end
    post = Post.new(title: ENV['title'],
                    tags: ENV['tags'],
                    filename: ENV['filename'],
                    published_at: Time.now)
    post.save

    puts "Post added with:"
    puts "Title: #{post.title}"
    puts "Tags: #{post.tags}"
    puts "Published at: #{post.published_at.strftime("%B %d, %H:%M")}"
    puts "Post added!"
  end

  task :list do
    posts = Post.all
    posts.each do |post|
      puts "Title: #{post.title}"
      puts "Tags: #{post.tags}"
      puts "Published at: #{post.published_at.strftime("%B %d, %H:%M")}"
    end
  end
end
