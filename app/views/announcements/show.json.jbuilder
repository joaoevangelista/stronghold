# frozen_string_literal: true
json.extract! @announcement, :id, :title, :description, :user_id,
              :notify, :created_at, :updated_at
