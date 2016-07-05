class AnnouncementNotification < ApplicationMailer

  default to: Proc.new { User.all.map(&:email) }

  def notify_about(announcement, recipients)
    @announcement = announcement
    mail(subject: announcement.title)
  end
end
