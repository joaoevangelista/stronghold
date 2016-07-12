# frozen_string_literal: true
# Job adapter to send email rightaway on background
class NotificationMailJob < ApplicationJob
  queue_as :default

  def perform(announcement, url)
    AnnouncementNotification.notify_about(announcement, url).deliver_now
  end
end
