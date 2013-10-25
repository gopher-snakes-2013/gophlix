require './config'

describe Gsnake do
  it "should register as a test" do
    true.should be true
  end

  it "should return what I expect it to" do
    person = Gsnake.first
    person.select_relevant.count.should > 0
  end

  it "should return a hash output" do
    person = Gsnake.first
    peer = Gsnake.last
    person.get_percent_similar(peer)[:name].should include("Zee Spencer")
  end
end
