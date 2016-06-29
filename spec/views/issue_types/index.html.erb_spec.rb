# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'issue_types/index', type: :view do
  before(:each) do
    assign(:issue_types, [
             IssueType.create!(
               name: 'Name',
               color: 'Color'
             ),
             IssueType.create!(
               name: 'Name',
               color: 'Color'
             )
           ])
  end

  it 'renders a list of issue_types' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Color'.to_s, count: 2
  end
end
