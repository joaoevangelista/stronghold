# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'issues/edit', type: :view do
  before(:each) do
    @issue = assign(:issue, Issue.create!(
                              title: 'MyString',
                              description: 'MyString',
                              is_resolved: false,
                              user: nil,
                              assignee_id: 1,
                              issue_type: nil
    ))
  end

  it 'renders the edit issue form' do
    render

    assert_select 'form[action=?][method=?]', issue_path(@issue), 'post' do
      assert_select 'input#issue_title[name=?]', 'issue[title]'

      assert_select 'input#issue_description[name=?]', 'issue[description]'

      assert_select 'input#issue_is_resolved[name=?]', 'issue[is_resolved]'

      assert_select 'input#issue_user_id[name=?]', 'issue[user_id]'

      assert_select 'input#issue_assignee_id[name=?]', 'issue[assignee_id]'

      assert_select 'input#issue_issue_type_id[name=?]', 'issue[issue_type_id]'
    end
  end
end
