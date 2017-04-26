require 'sinatra/base'

module Brewer
  class Server < Sinatra::Base
    set :sessions, true
    set :bind, "0.0.0.0"
    set :port, 8080

    get '/rspec-testing' do
      'tests are passing!'
    end

    run! if app_file == $0
  end
end
