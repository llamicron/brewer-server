require 'sinatra/base'
require 'brewer'

module Brewer
  class Server < Sinatra::Base
    configure do
      set :sessions, true
      set :bind, "0.0.0.0"
      set :port, 8080

      $brewer = Brewer.new
    end

    get '/rspec-testing' do
      'tests are passing!'
    end

    run! if app_file == $0
  end
end
