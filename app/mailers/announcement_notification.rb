class AnnouncementNotification < ApplicationMailer
  def notify_about(announcement, recipients)
    @announcement = announcement
    recipients.each do |recipient|
      mail(to: recipient.email, subject: announcement.title)
    end
  end
end
