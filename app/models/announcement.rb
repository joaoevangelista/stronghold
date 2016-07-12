# frozen_string_literal: true
# :nodoc:
class Announcement < ApplicationRecord
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }

  validates :user, :title, :description, presence: true

  belongs_to :user

  has_many :reads, dependent: :delete_all

  # Call notification and send the current url of announcement into it
  def notify_users(from)
    AnnouncementNotificationService.new(self, from).send if notify
  end
end
