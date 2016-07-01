# frozen_string_literal: false
require 'rails_helper'

RSpec.describe 'issue_types/edit', type: :view do
  before(:each) do
    @issue_type = assign(:issue_type, IssueType.create!(
                                        name: 'MyString',
                                        color: '#ff5555'
    ))
  end

  it 'renders the edit issue_type form' do
    render

    assert_select 'form[action=?][method=?]', issue_type_path(@issue_type), 'post' do
      assert_select 'input#issue_type_name[name=?]', 'issue_type[name]'

      assert_select 'input#issue_type_color[name=?]', 'issue_type[color]'
    end
  end
end
