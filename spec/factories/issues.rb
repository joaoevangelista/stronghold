# frozen_string_literal: true
FactoryGirl.define do
  factory :issue do
    title 'MyString'
    description 'MyString'
    is_resolved false
    user nil
    due_date '2016-06-29'
    assignee_id 1
    issue_type nil
  end
end
