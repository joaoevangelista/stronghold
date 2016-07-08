# frozen_string_literal: true
FactoryGirl.define do
  factory :comment do
    content 'MyString'
    user nil
    issue nil
  end
end
