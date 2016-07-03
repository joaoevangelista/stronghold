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

  it 'renders attributes' do
    render
  end
end
