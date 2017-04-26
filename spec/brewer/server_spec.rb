require "spec_helper"

RSpec.describe Brewer::Server do
  it "has a version number" do
    expect(Brewer::Server::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
