# frozen_string_literal: false
require 'rails_helper'

RSpec.describe 'issues/index', type: :view do
  before(:each) do
    assign(:issues, [
             Issue.create!(
               title: 'Title',
               description: 'Description',
               is_resolved: false,
               user: FactoryGirl.create(:user),
               assignee_id: 1,
               issue_type: FactoryGirl.create(:issue_type)
             ),
             Issue.create!(
               title: 'Title',
               description: 'Description',
               is_resolved: false,
               user: FactoryGirl.create(:another_user),
               assignee_id: 1,
               issue_type: FactoryGirl.create(:issue_type)
             )
           ])
  end

  it 'renders a list of issues' do
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
    assert_select 'tr>td', text: 'Description'.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 1.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
