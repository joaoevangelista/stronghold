# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'announcements/index', type: :view do
  before(:each) do
    assign(:announcements, [
             Announcement.create!(
               title: 'Title',
               description: 'Description',
               user: nil,
               notify: false
             ),
             Announcement.create!(
               title: 'Title',
               description: 'Description',
               user: nil,
               notify: false
             )
           ])
  end

  it 'renders a list of announcements' do
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
    assert_select 'tr>td', text: 'Description'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
  end
end
