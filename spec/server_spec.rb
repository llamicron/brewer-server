require_relative "spec_helper"
require_relative "../lib/brewer/server"

describe Brewer::Server do
  before :each do
    @server = Brewer::Server.new
  end

  it "can access a route" do
    get '/rspec-testing'

    expect(last_response).to be_ok
    expect(last_response.body).to eq("tests are passing!")
  end


end
