class NotificationMailJob < ActiveJob::Base
  queue_as :default

  def perform(announcement)
    users = User.all
    AnnouncementNotification.notify_about(announcement, users).deliver_now
  end
end
