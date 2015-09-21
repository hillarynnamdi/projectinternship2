class ClientsController < ApplicationController
  def index
  	@clients=Clients.all
  end

  def create
  	@client=Clients.new(client_params)
  	 if @client.save
  	 	redirect_to clients_index_path
  	 	flash.now[:saved] = 'CLIENT SAVED'
     else
      render 'new'
     end
  end

  def new
  	@client=Clients.new
  end

  private
  	def client_params
  		params.require(:client).permit(:first_name,:last_name,:email,:address,
  			:city,:state,:country,:phone_number,:gender)
  	end
end
