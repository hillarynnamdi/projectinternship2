class SignUpController < ApplicationController
skip_before_action :require_login

	def index
		@user=Users.new
	end

	def create
		@user = Users.new(params_attr)
			if @user.save
				UserMailer.signup_confirmation(@user).deliver
				 session[:confirm_email]="true"
        		 redirect_to account_confirmation_path(@user.company_name)
				
			else 
				
				render 'index'
				
				end

	end

	private
		def params_attr
			params.require(:user).permit(:first_name,:last_name,:email,:company_name,
				:company_address,:company_city,:company_state,
				:company_country,:company_email,:company_phone,:password,:password_confirmation)
		end

end



