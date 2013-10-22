require_relative "../../app"
require "rspec"
require 'rack'
require 'rack/test'

include Rack::Test::Methods

def app
  Sinatra::Application
end

include Rack::Test::Methods
# describe "create user", do

#   it "adds user to database" do
#     test_user = User.create(name: 'Test', email: 'test@test.com', password: 'test')
#     User.last.name.should eql "Test"
#   end
#   User.last.delete

#   it "create user with password in front-end" do
#     post '/sign_up', params={:name => 'Test1', :email => 'test@test.com', :password => 'test'}
#     User.last.name.should eql 'Test1'
#   end
# end


# describe "confirm session functionality" do
#   it ""

describe "null ratings are ignored" do
  it "nulls should not be counted in ratings" do
    nulls = []
    GameRating.all.each do |item|
      if item.rating == "" || item.rating == nil
        nulls << item.rating
      end
    end
    expect(nulls.length).to eql (0)
  end
end

