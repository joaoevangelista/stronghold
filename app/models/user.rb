# frozen_string_literal: true
# :nodoc:
class User < ApplicationRecord
  has_merit

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :email, presence: true

  has_many :issues
  has_many :announcements
  has_many :events
  has_many :comments
  has_many :votes
end
