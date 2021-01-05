class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def set_current_client
    @current_client = Client.find_by(user_id: current_user.id)
  end

  def set_current_contractor
    @current_contractor = Contractor.find_by(user_id: current_user.id)
  end
  
end
