# frozen_string_literal: false
require 'rails_helper'

RSpec.describe 'events/edit', type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
                              title: 'MyString',
                              description: 'MyString',
                              time: Time.now,
                              user: FactoryGirl.create(:user)
    ))
  end

  it 'renders the edit event form' do
    render

    assert_select 'form[action=?][method=?]', event_path(@event), 'post' do
      assert_select 'input#event_title[name=?]', 'event[title]'

      assert_select 'textarea#event_description[name=?]', 'event[description]'

      assert_select 'input#event_user_id[name=?]', 'event[user_id]'
    end
  end
end
