# frozen_string_literal: false
require 'rails_helper'

RSpec.describe 'events/new', type: :view do
  before(:each) do
    assign(:event, Event.new(
                     title: 'MyString',
                     description: 'MyString',
                     user: FactoryGirl.create(:user)
    ))
  end

  it 'renders new event form' do
    render

    assert_select 'form[action=?][method=?]', events_path, 'post' do
      assert_select 'input#event_title[name=?]', 'event[title]'

      assert_select 'textarea#event_description[name=?]', 'event[description]'

      assert_select 'input#event_user_id[name=?]', 'event[user_id]'
    end
  end
end
