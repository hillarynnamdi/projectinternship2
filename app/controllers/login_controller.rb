class LoginController < ApplicationController
skip_before_action :require_login




  def index
  end

  def create
  	user=Users.find_by(email: params[:email])
  	if user && user.authenticate(params[:password])
      if user.account_activated?
       session[:user_id]=user.id
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
  	session[:user_id] = nil
  	redirect_to login_index_path
    flash[:notice]="Logged Out!"
  end
end
