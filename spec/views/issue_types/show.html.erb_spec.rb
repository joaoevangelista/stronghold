# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'issue_types/show', type: :view do
  before(:each) do
    @issue_type = assign(:issue_type, IssueType.create!(
                                        name: 'Name',
                                        color: 'Color'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Color/)
  end
end
