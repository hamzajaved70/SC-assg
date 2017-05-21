class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include PublicActivity::StoreController

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied. Pleas Sign In First"
    redirect_to root_url
  end

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
