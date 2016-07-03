# frozen_string_literal: false
require 'rails_helper'

RSpec.describe 'issues/index', type: :view do
  before(:each) do
    assign(:issues, Kaminari.paginate_array([
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
                                            ]).page(1).per(20))
  end

  it 'renders a list of issues' do
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
    assert_select 'tr>td', text: 'Daisy'.to_s, count: 1
    assert_select 'tr>td', text: 'John'.to_s, count: 1
  end
end
