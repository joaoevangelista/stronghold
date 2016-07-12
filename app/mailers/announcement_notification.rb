# frozen_string_literal: true
# Mailer that sends announcements to all users
class AnnouncementNotification < ApplicationMailer
  default to: proc { User.all.map(&:email) }

  def notify_about(announcement, url)
    @url = url
    @announcement = announcement
    mail(subject: announcement.title)
  end
end
