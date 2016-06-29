# frozen_string_literal: true
json.array!(@issues) do |issue|
  json.extract! issue, :id, :title, :description, :is_resolved,
                :user_id, :due_date, :assignee_id, :issue_type_id
  json.url issue_url(issue, format: :json)
end
