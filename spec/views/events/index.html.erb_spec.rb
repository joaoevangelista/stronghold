# frozen_string_literal: false
require 'rails_helper'

RSpec.describe 'events/index', type: :view do
  before(:each) do
    assign(:events, Kaminari.paginate_array([
                                              Event.create!(
                                                title: 'Title',
                                                time: Time.now,
                                                description: 'Description',
                                                user: FactoryGirl.create(:user)
                                              ),
                                              Event.create!(
                                                title: 'Title',
                                                time: Time.now,
                                                description: 'Description',
                                                user: FactoryGirl.create(:another_user)
                                              )
                                            ]).page(1).per(20))
  end

  it 'renders a list of events' do
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
  end
end
