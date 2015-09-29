class ClientsController < ApplicationController
  def show
    @client = Client.find(params[:id])
  end

  def index
    redirect_to root_path
  end

  def new
    @client = Client.new
  end
  
  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to @client
    else
      render 'new'
    end
  end

  private

 def client_params
    params.require(:client).permit(:compname,:membername, :email, :password,
                                :password_confirmation)
 end
end
