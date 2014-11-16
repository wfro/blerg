require './lib/app'

ENV['RACK_ENV'] = 'production'

run BlergApp
