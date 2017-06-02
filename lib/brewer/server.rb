require 'sinatra/base'
require "sinatra/sse"
require 'rack/flash'
require 'brewer'
require 'wannabe_bool'

module Brewer
  class Server < Sinatra::Base
    # SSE Mixin
    include Sinatra::SSE

    configure do

      use Rack::Flash

      set :sessions, true
      set :bind, "0.0.0.0"
      set :port, 8080
      set :views, Proc.new { File.join(File.expand_path("../..", __dir__), "views") }
      enable :sessions

      $controller = Brewer::Controller.new
    end

    get '/' do
      erb :index
    end

    get '/pid' do
      sse_stream do |out|
        EM.add_periodic_timer(2) do
          out.push :event => "pid_status", :data => $controller.pid_to_web.to_json
        end
      end
    end

    get '/relays' do
      sse_stream do |out|
        EM.add_periodic_timer(2) do
          out.push :event => "relays_status", :data => $controller.relays_status_to_web.to_json
        end
      end
    end

    get '/rspec-testing' do
      'tests are passing!'
    end

    run! if app_file == $0
  end
end
