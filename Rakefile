require 'rake/testtask'
require_relative 'lib/app'

Rake::TestTask.new do |t|
  t.pattern = "test/**/*_test.rb"
end

task :default => [:test]

namespace :post do

  # Right now to add a post to the datastore you'll invoke rake task
  # and pass in the name/value pairs title and tags.
  #   $ rake post:add title="A Creative Blog Title" filename='creative_blog_title'
  # It's important that the filename you enter match the actual filename exactly,
  # and make sure to leave off the file extension.
  task :add do |task, args|

    # Allow alternate environments to be set from the command line
    ENV['RACK_ENV'] = 'production' unless ENV['RACK_ENV']
    
    post = Post.new(title: ENV['title'],
                    tags: ENV['tags'],
                    filename: ENV['filename'],
                    published_at: Time.now)
    post.save

    puts "Adding post..."
    puts
    puts ">  Title: #{post.title}"
    puts ">  Tags: #{post.tags}"
    puts ">  Published at: #{post.published_at.strftime("%B %d, %H:%M")}"
    puts
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
