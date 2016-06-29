# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'announcements/new', type: :view do
  before(:each) do
    assign(:announcement, Announcement.new(
                            title: 'MyString',
                            description: 'MyString',
                            user: nil,
                            notify: false
    ))
  end

  it 'renders new announcement form' do
    render

    assert_select 'form[action=?][method=?]', announcements_path, 'post' do
      assert_select 'input#announcement_title[name=?]', 'announcement[title]'

      assert_select 'input#announcement_description[name=?]', 'announcement[description]'

      assert_select 'input#announcement_user_id[name=?]', 'announcement[user_id]'

      assert_select 'input#announcement_notify[name=?]', 'announcement[notify]'
    end
  end
end
