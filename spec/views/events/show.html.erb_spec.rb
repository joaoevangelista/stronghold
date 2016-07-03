# frozen_string_literal: false
require 'rails_helper'

RSpec.describe 'events/show', type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
                              title: 'Title',
                              description: 'Description',
                              user: FactoryGirl.create(:user)
    ))
  end

  it 'renders attributes in <p>' do
    render
  end
end
