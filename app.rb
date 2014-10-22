require 'sinatra'
require 'sinatra/reloader'

class BlergApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
  end
end
