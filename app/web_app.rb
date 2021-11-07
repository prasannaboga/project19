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
  set :public_folder, "#{__dir__}/public"
  set :logger, Logger.new($stdout)
  set :server, :puma

  configure :development do
    register Sinatra::Reloader
  end

  get "/" do

    puts settings.public_folder

    erb :index, locals: {
      environment: settings.environment,
      server_start_at: ENV["SERVER_START_AT"],
      server_name: ENV["SERVER_NAME"],
    }
  end
end
