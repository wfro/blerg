require 'sinatra/base'
require 'sinatra/reloader'
require 'redcarpet'
require 'haml'
require_relative 'post'

class BlergApp < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :public_folder, File.dirname(__FILE__) + '/public'

  configure :development do
    register Sinatra::Reloader
  end

  not_found do
    haml :error
  end

  get '/' do
    haml :index, locals: {
      blog_text: markdown(:"posts/#{Post.last.filename}", fenced_code_blocks: true)
    }
  end

  get '/about' do
    haml :about
  end

  get '/archive' do
    haml :archive, locals: { posts: Post.all }
  end

  get '/:post' do |post|
    post = Post.all.detect { |p| p.filename == post }
    haml :post, locals: { 
      blog_text: markdown(:"posts/#{post.filename}", fenced_code_blocks: true) 
    }
  end
end

