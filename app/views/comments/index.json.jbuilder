# frozen_string_literal: true
json.array!(@comments) do |comment|
  json.extract! comment, :id, :content, :user_id, :issue_id
  json.url comment_url(comment, format: :json)
end
