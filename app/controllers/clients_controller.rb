class ClientsController < ApplicationController
  
  def index
  
  end

def show 
  @user=current_user
  @archive=@user.clients.where(archived:true)
  @active=@user.clients.where(archived:false)
  @all=@user.clients.all

  if params[:archived]
    @clients=@user.clients.where(archived:true).order("id DESC").page(params[:page]).per_page(5)
  elsif params[:search]
    @clients=@user.clients.where("first_name LIKE '%#{params[:search]}%' or last_name LIKE '%#{params[:search]}%' or phone_number like  '%#{params[:search]}%'").page(params[:page]).per_page(5)
  elsif params[:all_clients]
    @clients=@user.clients.all.page(params[:page]).per_page(5)
  else
  @clients=@user.clients.where(archived:false).order("id DESC").page(params[:page]).per_page(5)
  end

end

  def new
    @client=Client.new
    @user=current_user
  end

  def create
    @user=User.find_by(id:params[:user_id])
    @client=@user.clients.new(client_params)

     if @client.save
      redirect_to client_path(@user.company_name)
      flash.now[:saved] = 'Client was created successfully!'
     else
      render 'new'
     end
  end

  
  def edit
    @user=current_user
    @client=@user.clients.find(params[:id])
  end


   def update
    @user=current_user
    @client=Client.find(params[:id])

      if @client.update(client_params)
      redirect_to client_path(@user.company_name)
      else
        render 'edit'
      end

  end

  


  def destroy
    @user=User.find_by(id:params[:user_id])
    @client=@user.clients.find(params[:id])
    @client.destroy
    redirect_to client_path(@user.company_name)
  end

  private
    def client_params
      params.require(:client).permit(:first_name,:last_name,:email,:address,
        :city,:state,:country,:phone_number,:gender)
    end
end
