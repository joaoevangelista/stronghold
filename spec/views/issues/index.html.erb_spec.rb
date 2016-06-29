# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'issues/index', type: :view do
  before(:each) do
    assign(:issues, [
             Issue.create!(
               title: 'Title',
               description: 'Description',
               is_resolved: false,
               user: nil,
               assignee_id: 1,
               issue_type: nil
             ),
             Issue.create!(
               title: 'Title',
               description: 'Description',
               is_resolved: false,
               user: nil,
               assignee_id: 1,
               issue_type: nil
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
