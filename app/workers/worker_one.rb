Sidekiq.configure_server do |config|
  config.redis = { url: ENV["REDIS_URL"] }
end

class WorkerOne
  include Sidekiq::Worker
  sidekiq_options queue: "apple"
  def perform
    queue = sidekiq_options_hash["queue"]
    puts "WorkerOne started task on queue #{queue}"
    sleep 60 * 1
    puts "WorkerOne completed task on queue #{queue}"
  end
end
