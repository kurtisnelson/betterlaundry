class Api::V1::MachinesController < ApplicationController
  respond_to :json

  def index
    respond_with Machine.all
  end

  def show
    respond_with Machine.find(params[:id])
  end

  def notify(user)
    NotificationWorker.perform_async(params[:machine_id], user.email)
    respond_with true
  end
end
