class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = RoomDecorator.decorate(Room.find(params[:id]))
  end

  def sync
    RoomSyncWorker.perform_async(params[:room_id])
    flash[:notice] = "Syncing the room"
    redirect_to request.referrer
  end
end
