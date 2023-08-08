class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:secret]
  
  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :desciption, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :desciption, :email, :password, :password_confirmation)}
  end

  def index
  end

  def secret
  end
end
