class ApplicationController < ActionController::Base
  # protect_from_forgery # CSRF対策
  skip_before_action :verify_authenticity_token # トークンを無視
  
  before_action :authenticate_user!, except: [:top, :about]
  
  
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
  
end
