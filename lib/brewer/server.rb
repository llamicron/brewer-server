require 'sinatra/base'
require "sinatra/sse"
require 'rack/flash'
# require 'brewer'

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

      # $brewer = Brewer.new
    end

    get '/' do
      erb :index
    end

    get '/test-sse-stream' do
      sse_stream do |out|
        EM.add_periodic_timer(2) do
          # out.push :event => "pid_status", :data => $brewer.pid.map {|k, v| "#{k}: #{v}"}.join(" || ")
          # Hardware agnostic test
          out.push :event => "pid_status", :data => {'pid_running' => true, 'sv' => 150, 'pv' => 85}.to_s
        end
      end
    end

    get '/rspec-testing' do
      'tests are passing!'
    end

    run! if app_file == $0
  end
end
