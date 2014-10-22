require 'sinatra'
require 'sinatra/reloader'

class BlergApp < Sinatra::Base
  set :root, File.dirname(__FILE__)

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    haml :index
  end
end
