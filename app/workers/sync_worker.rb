class SyncWorker
  include Sidekiq::Worker
  
  def perform
    Room.all.pluck(:id).each do |id|
      RoomSyncWorker.perform_async id
    end
    SyncWorker.perform_in(4.minutes)
  end
end
