class ClientsController < ApplicationController
  def show
    @client = Client.find(params[:id]) #このクライアントをClientから特定
    @campaigns = @client.campaigns #特定したクライアントのキャンペンを
    @campaign = current_client.campaigns.build
#    @campaign.campcats.build # これ！
#    @campsall = Campaign.all.order("updated_at DESC").limit(30) if not nil
    @campcate = Campcat.all.order("updated_at DESC").limit(30) if not nil
   
  end

  def new
    @client = Client.new
    @campaign.campcats.build # これ！
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
