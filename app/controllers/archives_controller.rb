class ArchivesController < ApplicationController
	def update
		@user=current_user
		@client=@user.clients.find_by(id:params[:id])

		if @client
			@client.update_attribute(:archived, true)
			redirect_to client_path(@user.company_name)
		end

	end


	def destroy
	@user=current_user
	@client=@user.clients.find_by(id:params[:id])

		if @client
			@client.update_attribute(:archived, false)
			redirect_to client_path(@user.company_name)
		end

	end

end
