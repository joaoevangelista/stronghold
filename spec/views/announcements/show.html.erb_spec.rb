# frozen_string_literal: false
require 'rails_helper'

RSpec.describe 'announcements/show', type: :view do
  before(:each) do
    @announcement = assign(:announcement, Announcement.create!(
                                            title: 'Title',
                                            description: 'Description',
                                            user: FactoryGirl.create(:user),
                                            notify: false
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
