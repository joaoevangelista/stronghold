# Main hub to receive and send notifications into mail job
class AnnouncementNotificationService

  def initialize(announcement)
    @announcement = announcement
  end


  def send
    puts "I'm sending an email to nofify about #{@announcement.title}"
    NotificationMailJob.perform_later @announcement
  end

end
