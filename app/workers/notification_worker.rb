class NotificationWorker
  include Sidekiq::Worker

  def perform id, email

  end
end
