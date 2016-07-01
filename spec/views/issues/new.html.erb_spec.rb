# frozen_string_literal: false
require 'rails_helper'

RSpec.describe 'issues/new', type: :view do
  before(:each) do
    assign(:issue, Issue.new(
                     title: 'MyString',
                     description: 'MyString',
                     is_resolved: false,
                     user: FactoryGirl.create(:user),
                     assignee_id: 1,
                     issue_type: FactoryGirl.create(:issue_type)
    ))
  end

  it 'renders new issue form' do
    render

    assert_select 'form[action=?][method=?]', issues_path, 'post' do
      assert_select 'input#issue_title[name=?]', 'issue[title]'

      assert_select 'input#issue_description[name=?]', 'issue[description]'

      assert_select 'input#issue_is_resolved[name=?]', 'issue[is_resolved]'

      assert_select 'input#issue_user_id[name=?]', 'issue[user_id]'

      assert_select 'input#issue_assignee_id[name=?]', 'issue[assignee_id]'

      assert_select 'input#issue_issue_type_id[name=?]', 'issue[issue_type_id]'
    end
  end
end
