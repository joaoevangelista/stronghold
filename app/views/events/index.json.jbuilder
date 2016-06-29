# frozen_string_literal: true
json.array!(@events) do |event|
  json.extract! event, :id, :title, :description, :user_id, :time
  json.url event_url(event, format: :json)
end
