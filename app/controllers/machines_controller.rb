class MachinesController < ApplicationController
  def notify
    NotificationWorker.perform_async(params[:machine_id], current_user.email)
    redirect_to request.referrer 
  end
end
