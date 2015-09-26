class ProfileController < ApplicationController
  def show
  	@user=current_user
  end

  def edit
  	@user=current_user
  end

 def update
 	@user=User.find_by(company_name:params[:id])
	 	if @user
	  		if @user.update(params_attr)
	  			redirect_to profile_path(@user.company_name)
	  		else
	  			render 'edit'
	  		end
	  	end
  end


private
		def params_attr
			params.require(:user).permit(:first_name,:last_name,:email,:company_name,
				:company_address,:company_city,:company_state,
				:company_country,:company_email,:company_phone,:password,:password_confirmation,:image)
		end

end
