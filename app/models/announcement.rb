# frozen_string_literal: true
# :nodoc:
class Announcement < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }

  validates :user, :title, :description, presence: true

  belongs_to :user

  after_save :notify_users

  def notify_users
    AnnouncementNotificationService.new(self).send if notify
  end
end
