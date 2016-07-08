# frozen_string_literal: true
# Job adapter to send email rightaway on background
class NotificationMailJob < ApplicationJob
  queue_as :default

  def perform(announcement)
    users = User.all
    AnnouncementNotification.notify_about(announcement, users).deliver_now
  end
end
