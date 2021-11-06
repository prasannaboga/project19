# frozen_string_literal: true

require "dotenv/load"
require "logger"
require "json"
require "rack"
require "sinatra"
require "socket"

# Webapp to sinatra server
class WebApp < Sinatra::Base
  enable :static
  enable :logging

  set :environment, ENV["APP_ENV"]
  set :public_folder, "#{File.dirname(__FILE__)}/public"
  set :logger, Logger.new($stdout)
  set :server, :puma
  set :app_file, __FILE__

  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    server_name = Socket.gethostname
    logger.info "[server] name :: #{server_name}"
    content_type :json
    { status: :ok, app_env: ENV["APP_ENV"] }.to_json
  end
end
