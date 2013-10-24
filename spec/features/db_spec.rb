require "./app"
require "rspec"
require 'rack/test'

include Rack::Test::Methods

def app
  Sinatra::Application
end
