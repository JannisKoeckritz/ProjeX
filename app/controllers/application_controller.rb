class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    # def set_locale
    #   I18n.locale = params[:locale] || I18n.default_locale
    # end

    # def default_url_options
    #   { locale: I18n.locale }
    # end

  def configure_permitted_parameters
    added_attrs = [:first_name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
