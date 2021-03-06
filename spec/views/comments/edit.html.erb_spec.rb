# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'comments/edit', type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
                                  content: 'MyString',
                                  user: nil,
                                  issue: nil
    ))
  end

  it 'renders the edit comment form' do
    render

    assert_select 'form[action=?][method=?]', comment_path(@comment), 'post' do
      assert_select 'input#comment_content[name=?]', 'comment[content]'

      assert_select 'input#comment_user_id[name=?]', 'comment[user_id]'

      assert_select 'input#comment_issue_id[name=?]', 'comment[issue_id]'
    end
  end
end
