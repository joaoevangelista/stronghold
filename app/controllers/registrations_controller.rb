# frozen_string_literal: true
# Override of Devise controller to customize the permited fields
class RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication, only: [:new, :create]

  # Override devise to better manage the sign up process
  def create
    build_resource(sign_up_params)
    authorize resource, :create?
    resource.add_role(params[:role] ? params[:role].to_sym : :resident)
    resource.save
    if resource.persisted?
      notice_user_and_redirect resource
    else
      reset_form resource
    end
  end

  def new
    build_resource({})
    authorize resource, :new?
    @roles = default_roles
    super
  end

  def sign_up_params
    params.require(:user).permit(:email, :name, :password,
                                 :password_confirmation, :current_password, :role)
  end

  def account_update_params
    params.require(:user).permit(:email, :name, :password,
                                 :password_confirmation, :current_password)
  end

  protected

  def after_sign_up_path(_resource)
    announcements_path
  end

  private

  def default_roles
    [[I18n.t('user.roles.resident'), 'resident'], [I18n.t('user.roles.manager'), 'manager']]
  end

  def reset_form(resource)
    clean_up_passwords resource
    set_minimum_password_length
    respond_with resource
  end

  def notice_user_and_redirect(resource)
    set_flash_message! :notice, :signed_up
    respond_with resource, location: after_sign_up_path_for(resource)
  end
end
