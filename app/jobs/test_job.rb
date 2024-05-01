class TestJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Rails.logger.info("Rails.logger.info Performing: #{Time.zone.now.strftime('%Y/%m/%d %H:%M:%S')}")
  end
end
