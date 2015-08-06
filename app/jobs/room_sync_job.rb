require 'laundry_view'
class RoomSyncJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    room = Room.find(args[0])
    laundry_view = LaundryView::Sync.new room.lvid

    laundry_view.each_with_index do |machine, i|
      obj = Machine.where(room: room, number: (i+1)).first_or_create
      obj.remaining = machine.remaining
      obj.kind = machine.kind
      obj.out_of_service = machine.broken
      obj.save
    end
    room.last_synced = DateTime.now
    room.save
  end
end
