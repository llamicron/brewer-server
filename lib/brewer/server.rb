require 'sinatra/base'
require "sinatra/sse"
require 'rack/flash'
require 'brewer'
require "brewer/stats"

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
    end

    get '/' do
      erb :index
    end

    get '/pid' do
      sse_stream do |out|
        EM.add_periodic_timer(2) do
          out.push :event => "pid_status", :data => {
            'pid_running' => rand(0..1).to_b,
            'sv'          => rand(75..150),
            'pv'          => rand(75..150)
          }.to_json
        end
      end
    end

    get '/relays' do
      sse_stream do |out|
        EM.add_periodic_timer(2) do
          out.push :event => "relays_status", :data => {
            "hltToMash"  => rand(0..1),
            "hlt"        => rand(0..1),
            "rimsToMash" => rand(0..1),
            "pump"       => rand(0..1)
          }.to_json
        end
      end
    end

    get "/stats" do
      sse_stream do |out|
        EM.add_periodic_timer(2) do
          # This uses hardware
          # out.push :event => "stats", :data => Brewer::Stats::Formatter::json

          # This uses unix timesptamps.
          out.push :event => "stats", :data => {"1496101425":{"pv":138.7},"1496101426":{"pv":138.7},"1496101427":{"pv":138.7},"1496101428":{"pv":138.7},"1496101429":{"pv":138.7},"1496101430":{"pv":138.7}}.to_json
        end
      end
    end

    get '/rspec-testing' do
      'tests are passing!'
    end

    run! if app_file == $0
  end
end
