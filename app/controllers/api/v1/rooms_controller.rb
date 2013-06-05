class Api::V1::RoomsController < ApplicationController
  respond_to :json

  def index
    respond_with Room.all
  end

  def show
    respond_with Room.find(params[:id])
  end

  def sync
    RoomSyncWorker.perform_async(params[:room_id])
    respond_with true
  end
end
