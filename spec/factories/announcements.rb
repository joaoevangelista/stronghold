# frozen_string_literal: true
FactoryGirl.define do
  factory :announcement do
    title 'MyString'
    description 'MyString'
    user nil
    notify false
  end
end
