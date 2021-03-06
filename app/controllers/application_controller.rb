class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # def after_sign_in_path_for resource_or_scope
  #   blog_posts_path
  # end

	def after_sign_out_path_for resource_or_scope
		root_path
	end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, 
      :password_confirmation, :name, :address, :phone) }

     devise_parameter_sanitizer.for(:account_update) { |u| u.permit({ roles: [] }, :email, :password, 
     :password_confirmation, :current_password, :name, :address, :phone) }
    end
end
