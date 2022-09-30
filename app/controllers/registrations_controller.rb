class RegistrationsController < Devise::RegistrationsController
  protected
  def create
    super
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :forename, :surname])
  end

  def after_sign_up_path_for(resource)
    root_path
  end
end