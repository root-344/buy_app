class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_side

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana])

    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
  end
  
  def set_side
    @farms = Farm.all
  end
end
