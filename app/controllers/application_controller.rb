# frozen_string_literal: true
# :nodoc:
class ApplicationController < ActionController::Base
  # StoreController to customize owner of public activity
  include PublicActivity::StoreController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  rescue_form Pudint::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    flash[:error_notice] = t("#{policy_name}.#{exception.query}", scope: 'pudint',
                                                                  default: :default)
    redirect_to(request.refferer || root_path)
  end

  private

  def set_locale
    I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
  end
end
