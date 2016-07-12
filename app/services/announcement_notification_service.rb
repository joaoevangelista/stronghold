# frozen_string_literal: true
# Main hub to receive and send notifications into mail job
class AnnouncementNotificationService
  def initialize(announcement, url)
    @announcement = announcement
    @url = url
  end

  def send
    puts "I'm sending an email to nofify about #{@announcement.title}"
    NotificationMailJob.perform_later @announcement, @url
  end
end
