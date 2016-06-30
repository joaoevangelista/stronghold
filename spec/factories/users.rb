# frozen_string_literal: true
FactoryGirl.define do
  factory :user, class: User do
    name 'Daisy'
    password '123456'
    email 'daisy@keep.com'
  end
end
