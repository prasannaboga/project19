require "bundler"
require "dotenv/load"
require "socket"

Bundler.require

ENV["SERVER_START_AT"] = DateTime.now.strftime("%Y.%m.%d.%H.%M.%S")
ENV["SERVER_NAME"] = Socket.gethostname

require "./app/web_app"

map("/") { run WebApp }
