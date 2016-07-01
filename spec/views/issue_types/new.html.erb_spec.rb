# frozen_string_literal: false
require 'rails_helper'

RSpec.describe 'issue_types/new', type: :view do
  before(:each) do
    assign(:issue_type, IssueType.new(
                          name: 'MyString',
                          color: '#ff5555'
    ))
  end

  it 'renders new issue_type form' do
    render

    assert_select 'form[action=?][method=?]', issue_types_path, 'post' do
      assert_select 'input#issue_type_name[name=?]', 'issue_type[name]'

      assert_select 'input#issue_type_color[name=?]', 'issue_type[color]'
    end
  end
end
