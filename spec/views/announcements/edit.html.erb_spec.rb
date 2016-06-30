# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'announcements/edit', type: :view do
  before(:each) do
    @announcement = assign(:announcement, Announcement.create!(
                                            title: 'MyString',
                                            description: 'MyString',
                                            user: FactoryGirl.create(:user),
                                            notify: false
    ))
  end

  it 'renders the edit announcement form' do
    render

    assert_select 'form[action=?][method=?]', announcement_path(@announcement), 'post' do
      assert_select 'input#announcement_title[name=?]', 'announcement[title]'

      assert_select 'input#announcement_description[name=?]', 'announcement[description]'

      assert_select 'input#announcement_user_id[name=?]', 'announcement[user_id]'

      assert_select 'input#announcement_notify[name=?]', 'announcement[notify]'
    end
  end
end
