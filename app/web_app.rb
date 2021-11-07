# frozen_string_literal: true

require "dotenv/load"
require "logger"
require "json"
require "rack"
require "sinatra"

# Webapp to sinatra server
class WebApp < Sinatra::Base
  enable :static
  enable :logging

  set :environment, ENV["APP_ENV"]
  set :logger, Logger.new($stdout)
  set :server, :puma

  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    erb :index, locals: {
      environment: settings.environment,
      server_start_at: ENV["SERVER_START_AT"],
      server_name: ENV["SERVER_NAME"]
    }
  end
end
