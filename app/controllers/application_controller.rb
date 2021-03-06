class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		books_path(id: resource.id)
	end

	def books_index
		Books.finds_by(user_id: resource.id)
	end

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
		devise_parameter_sanitizer.permit(:account_update, keys: [:username])
	end
end
