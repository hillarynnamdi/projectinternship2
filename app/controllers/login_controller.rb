class LoginController < ApplicationController
skip_before_action :require_login
before_action :current_user

  def index
  end

  def create
  	user=Users.find_by(email: params[:email])
  	if user && user.authenticate(params[:password])
      if user.account_activated?
        if params[:remember_me]
          cookies.permanent[:auth_token]=user.auth_token
    #   log_in user
        else
          cookies[:auth_token]=user.auth_token
        end
        redirect_to dashboard_path(user.company_name)
      else
        flash[:invalid_input] = "Account not activated. Check your email for the activation link!"
        redirect_to login_index_path
      end
  else
  		flash.now[:invalid_input] = 'Invalid Email or password!'
  		render 'index'
  end


  end

  def destroy
   # log_out
  	cookies.delete(:auth_token)
  	redirect_to login_index_path
    flash[:notice]="Logged Out!"
  end
end
