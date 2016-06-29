# frozen_string_literal: true
json.extract! @issue, :id, :title, :description, :is_resolved,
              :user_id, :due_date, :assignee_id, :issue_type_id, :created_at, :updated_at
