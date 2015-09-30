class InvoicesController < ApplicationController

  def edit
  	@user=current_user
  	@client=@user.clients.find(params[:id])
  	
  end

  def new

  end 

  def show
  		  	
  end

  def create
  	
  end
end
