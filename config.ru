require "bundler"
require "dotenv/load"
require "socket"
require "sidekiq"
require "sidekiq/web"

Bundler.require

require "./app/web_app"

ENV["SERVER_START_AT"] = DateTime.now.strftime("%Y.%m.%d.%H.%M.%S")
ENV["SERVER_NAME"] = Socket.gethostname

Sidekiq.configure_client do |config|
  config.redis = {
    url: ENV["REDIS_URL"],
    password: ENV["REDIS_PASSWORD"]
  }
end

use Rack::Session::Cookie, secret: ENV["SESSION_SECRET"], same_site: true, max_age: 86_400

run Rack::URLMap.new("/" => WebApp, "/sidekiq" => Sidekiq::Web)
