class ForgotPasswordController < ApplicationController
skip_before_action :require_login

  def index
  	@user=Users.new
  end

  def update
  	@user=Users.find_by(forgot_token: params[:id])
  	if @user
  		if 
			@user.forgot_token_sent_at<3.minutes.ago
			@user.clear_forgott_token
			redirect_to login_index_path
			flash[:change_pass]="Your password link has expired"
		else
			@update=@user.update(params_attr)
			if @update
				flash[:change_pass]="Your password has been changed successfully!"
				@user.clear_forgott_token
				redirect_to login_index_path
			else
				render 'edit'
			end
		end
	else
		flash[:change_pass]="invalid token!"
		redirect_to login_index_path
	end

  end

	def create
		@user=Users.find_by(email: params[:email].downcase)
			if @user 
				@user.forgott_token
				UserMailer.forgot_password(@user).deliver
				flash[:change_pass]="Your password recovery link has been sent to your email!"
				redirect_to login_index_path
			else
				redirect_to login_index_path
				flash[:change_pas]="user does not exist!"


			end
	end

	def edit
		@user=Users.find_by!(forgot_token: params[:id])
	end

	def show
		@user=Users.find_by!(forgot_token: params[:id])
	end


	private
	def params_attr
		params.require(:user).permit(:password,:password_confirmation)
	end

  
end
