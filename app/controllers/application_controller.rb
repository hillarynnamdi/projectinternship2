
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include LoginHelper
  before_action :require_login

 

private 
	def current_user
		@current_user||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
		
		
	end
	helper_method :current_user
end


private 
	def require_login

		if cookies[:auth_token].nil?
			redirect_to login_index_path
			flash[:loginflash]="Sorry the page cannot be accessed unless you're logged in"
		
		end
	end
