# frozen_string_literal: false
require 'rails_helper'

RSpec.describe 'issues/show', type: :view do
  before(:each) do
    @issue = assign(:issue, Issue.create!(
                              title: 'Title',
                              description: 'Description',
                              is_resolved: false,
                              user: FactoryGirl.create(:user),
                              assignee_id: 1,
                              issue_type: FactoryGirl.create(:issue_type)
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
  end
end
