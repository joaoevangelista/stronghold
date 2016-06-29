# frozen_string_literal: true
json.array!(@announcements) do |announcement|
  json.extract! announcement, :id, :title, :description, :user_id, :notify
  json.url announcement_url(announcement, format: :json)
end
