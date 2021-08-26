class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  # rescue_from Acl9::AccessDenied do |exception|
  #   respond_to do |format|
  #     format.json do
  #       render :json => { :success => false, :message => "You do not have access to do this action." }
  #     end
  #     format.html do
  #       flash[:error] = 'You do not have access to view this page.'
  #       redirect_to root_url
  #     end
  #   end
  # end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role_id])
  end
end
