require 'laundry_view'

class RoomSyncWorker
  include Sidekiq::Worker

  def perform id
    room = Room.find(id)
    laundry_view = LaundryView::Sync.new room.lvid

    laundry_view.each_with_index do |machine, i|
      obj = Machine.where(room: room, number: (i+1)).first_or_create
      obj.status = machine.status
      obj.remaining = machine.remaining
      obj.save
    end
    room.last_synced = DateTime.now
    room.save
  end
end
