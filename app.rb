require 'sinatra/base'
require 'sinatra/reloader'
require 'redcarpet'
require 'haml'
require_relative 'lib/post'

class BlergApp < Sinatra::Base
  set :root, File.dirname(__FILE__)

  configure :development do
    register Sinatra::Reloader
  end

  not_found do
    haml :error
  end

  get '/' do
    haml :index, locals: {
      blog_text: markdown(:'posts/yart', fenced_code_blocks: true)
    }
  end

  get '/about' do
    haml :about
  end
end

