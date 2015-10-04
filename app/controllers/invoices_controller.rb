class InvoicesController < ApplicationController

  def index
    @user=User.find_by(params[:user_id])
    @client=Client.find_by(params[:client_id])
     @invoice = Invoices.find_by(params[:id])
  end

  def show   
    @user=current_user
    @client=Client.find_by(params[:client_id])
    @invoice = @client.invoices.find_by(id:params[:id])
  end

  def new
    @user=current_user
    @client  = Client.find_by(id:params[:client_id])
    @invoice = Invoice.new
  end 

  def edit
  	@user=User.find_by(params[:user_id])
  	@client=Client.find_by(params[:client_id])
    @invoice = Invoice.find_by(id:params[:id])
  end

  def create
    @user=current_user
    @client = Client.find_by(id:params[:client_id])
    @invoice = @client.invoices.new(attr_params)
    if @invoice.save
       redirect_to user_client_invoice_path(@user.id,@client,@invoice.id)
    else
        
    end  	
  end

  def update

    @user=User.find_by(params[:user_id])
    @client = Client.find_by(params[:client_id])  
    @invoice=Invoice.find_by(id:params[:id])
    if @invoice
      UserMailer.invoice_mail(@client).deliver
      flash[:change_pass]="Invoice sent successfully!"
      redirect_to client_path(@user.company_name)
      #redirect_to user_client_invoice_path(@user.id,@client,@invoice.id)
    end
  end

  def destroy
    @user=current_user
    @client = Client.find_by(params[:client_id])
    @invoice=@client.invoices.find_by(params[:id])
    @invoice.destroy
    redirect_to client_path(@user.company_name)
  end
def invoice_link

end

private 
  def attr_params
    params.require(:invoice).permit(:item_code,:description,:qty,:unit,:total)
  end

end
