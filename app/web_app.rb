# frozen_string_literal: true

require "dotenv/load"
require "logger"
require "json"
require "rack"
require "sinatra"
require_relative "workers/worker_one"

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

  post "/create_job" do
    no_of_jobs = params[:no_of_jobs].to_i
    queue = params[:queue]
    queue ||= "apple"
    logger.info "Number of Jobs :: #{no_of_jobs} on queue :: #{queue}"
    no_of_jobs.times do
      WorkerOne.set(queue: queue.to_sym).perform_async
    end
    redirect "/"
  end
end
