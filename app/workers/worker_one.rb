require "aws-sdk-cloudwatch"
require "dotenv"

Dotenv.load(".env")

Sidekiq.configure_server do |config|
  config.redis = {
    url: ENV["REDIS_URL"],
    password: ENV["REDIS_PASSWORD"]
  }
end

class WorkerOne
  include Sidekiq::Worker

  def perform(opts)
    queue = opts["queue"]
    client = Aws::CloudWatch::Client.new(
      region: "us-east-1"
    )
    client.put_metric_data(
      namespace: "project19",
      metric_data: [
        {
          metric_name: "jobs",
          dimensions: [
            {
              name: "worker",
              value: "WorkerOne"
            },
            {
              name: "queue",
              value: queue
            }
          ],
          value: 1,
          unit: "Count"
        }
      ]
    )
    puts "WorkerOne started task on queue #{queue}"
    sleep 60 * 0.5
    puts "WorkerOne completed task on queue #{queue}"
  end
end
