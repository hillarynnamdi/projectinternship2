class InvoicesController < ApplicationController

  def index
    @invoice =Invoice.new
    @user=User.find_by(params[:user_id])
    @client=Client.find_by(:client_id)
  end

  def show
          #<%=link_to "Create Inv.",  edit_invoice_path(client) %>
  end
# edit_user_client_invoice_path(@user.id,client.id,params[:id])
  def new
    @user=current_user
    @client  = Client.find_by(id:params[:client_id])
    @invoice = Invoice.new
  end 

  def edit
  	@user=current_user
  	@client=@user.clients.find(params[:id])
  	# @client  = Client.find_by(id:params[:client_id])
     #@client=Client.find_by(:client_id)
   
   # @user=User.find_by(params[:user_id])
   
  end

  def create
     @user=current_user
    #@client = @user.clients.find_by(id:params[:client_id])
    @client = Client.find_by(id:params[:client_id])
    @invoice = @client.invoices.new(attr_params)

    if @invoice.save
       redirect_to user_client_invoices_path(@user.id,@client)
    else
        
    end  	
  end

private 
  def attr_params
    params.require(:invoice).permit(:item_code,:description,:qty,:unit,:total)
  end

end
