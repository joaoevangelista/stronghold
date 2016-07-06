# frozen_string_literal: true
# Override of Devise controller to customize the permited fields
class RegistrationsController < Devise::RegistrationsController

  # Override devise create method and add code before it
  def create
    build_resource(sign_up_params)
    authorize resource, :create?
    super
  end

  def new
    build_resource({})
    authorize resource, :new?
    super
  end

  def sign_up_params
    params.require(:user).permit(:email, :name, :password,
    :password_confirmation, :current_password)
  end

  def account_update_params
    params.require(:user).permit(:email, :name, :password,
    :password_confirmation, :current_password)
  end
end
