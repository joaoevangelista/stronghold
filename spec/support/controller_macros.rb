# frozen_string_literal: true
module ControllerMacros
  def login_user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      maybe_user = User.where(email: 'daisy@stronghold.com').first
      user = if !maybe_user
               FactoryGirl.create(:user)
             else
               maybe_user
             end
      sign_in user
    end
  end
end
