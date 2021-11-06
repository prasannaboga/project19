require "bundler"
require "dotenv/load"

Bundler.require

ENV["SERVER_START_TIME"] = DateTime.now.strftime("%Y.%m.%d.%H.%M.%S")

require "./app/web_app"

map("/") { run WebApp }
