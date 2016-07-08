# frozen_string_literal: false
require 'rails_helper'

RSpec.describe 'announcements/index', type: :view do
  before(:each) do
    assign(:announcements, Kaminari.paginate_array([
                                                     Announcement.create!(
                                                       title: 'Title',
                                                       description: 'Description',
                                                       user: FactoryGirl.create(:user),
                                                       notify: false
                                                     ),
                                                     Announcement.create!(
                                                       title: 'Title',
                                                       description: 'Description',
                                                       user: FactoryGirl.create(:another_user),
                                                       notify: false
                                                     )
                                                   ]).page(1).per(10))
  end

  it 'renders a list of announcements' do
    allow(view).to receive(:policy).and_return double(new?: true)
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
  end
end
