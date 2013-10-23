require "./app"
require "rspec"
require 'rack/test'

include Rack::Test::Methods

def app
  Sinatra::Application
end

# describe "null ratings are ignored" do
#   it "nulls should not be counted in ratings" do
#     nulls = []
#     GameRating.all.each do |item|
#       if item.rating == "" || item.rating == nil
#         nulls << item.rating
#       end
#     end
#     expect(nulls.length).to eql (0)
#   end
# end
