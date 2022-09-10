class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || categories_path
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation)
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
end
