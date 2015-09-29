class CampaignsController < ApplicationController
    before_action :logged_in_client, only: [:create]
    
    def new
     @campaign = current_client.campaigns.build
    end
    
    
    def show
#    @campaign = current_client.campaigns.build if client_logged_in?
#    @campaigns = @client.campaigns
    end
    
    def create
     @campaign = current_client.campaigns.build(campaign_params)
     if @campaign.save
         flash[:success] = "キャンペーン登録完了"
         redirect_to request.referrer 
     else
         render 'static_pages/index'
     end
    end
    
    def destroy
     @campaign = current_client.campaigns.find_by(id: params[:id])
     return redirect_to root_url if @campaign.nil?
     @campaign.destroy
     flash[:success] = "Campaign deleted"
     redirect_to request.referrer || root_url
    end
    
    private
    def campaign_params
        params.require(:campaign).permit(:title,:summary,:content)
    end
    
end
