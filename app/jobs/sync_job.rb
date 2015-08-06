class SyncJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    Room.all.pluck(:id).each do |id|
      RoomSyncJob.perform_later id
    end
    SyncJob.set(wait_until: 2.minutes.from_now).perform_later
  end
end
