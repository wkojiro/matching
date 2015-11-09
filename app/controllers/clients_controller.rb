class ClientsController < ApplicationController
  def show
    @client = Client.find(params[:id]) #このクライアントをClientから特定
    @campaigns = @client.campaigns #特定したクライアントのキャンペンを
# @campaign = current_client.campaigns.build

#    @campaign.campcats.build # これ！
#    @campsall = Campaign.all.order("updated_at DESC").limit(30) if not nil
#    @campcate = Campcat.all.order("updated_at DESC").limit(30) if not nil
#    @campan = Campaign.where(id: 48).first.categories
#     @campan = Campaign.where(id: current_campaign).first.categories  
  end

  def new
    @client = Client.new
#    @campaign.campcats.build # これ！
  end
  
  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to @client
    else
      render 'new'
    end
  end

  def edit
    @client = Client.find(params[:id])
  end
  
  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      flash[:success] = "update done!"        
      redirect_to @client
    else
      render 'new'
    end
  end  


  
  
  

  private

 def client_params
    params.require(:client).permit(:compname,:compnamefurigana,:membername,:membernamefurigana,
    :honsya_postel,:honsya_postel02,:honsya_address01,:honsya_address02,:honsya_address03,:honsya_address04,:honsya_tel,:honsya_fax,:honsya_url,
    :daihyou,:since,:capital,:employee,:gyousyu,:business,:bikou,:email, :password,:password_confirmation,:section,:position,:membercomp,
    :memberpostel,:memberpostel02,:memberaddress01,:memberaddress02,:memberaddress03,:memberaddress04,:mebertel,:memberfax,:agreeflg)
 end
end
