class ApplicationController < ActionController::Base
  #before_action :authenticate_user!
  before_action :basic_auth
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day])
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述
    end
  end

  def redirect_to_root_user_signed_in
    redirect_to root_path if user_signed_in?
  end

  def redirect_to_login_form_unless_signed_in
    redirect_to new_signin_path unless user_signed_in?
  end

end
