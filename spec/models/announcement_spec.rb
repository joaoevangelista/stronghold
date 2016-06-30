# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Announcement, type: :model do
  it 'does not save when invalid params are passed' do
    announcement = described_class.new(title: 'Something')
    saved = announcement.save
    expect(saved).to be_falsey
  end

  it 'saves latin encoded characters' do
    announcement = described_class.new(title: 'Pool are closed!',
                                       description: 'Gonçalez is cleaning today',
                                       user: FactoryGirl.create(:user))
    saved = announcement.save
    expect(saved).to be_truthy
    expect(announcement.id).not_to be_nil
    expect(announcement.description).to match(/Gonçalez/)
  end
end
