class CampaignsController < ApplicationController
    before_action :logged_in_client, only: [:create]

    
    def new
     @campaign = current_client.campaigns.build
     @campaign.campcats.build # これ！
    end
    
    
    def show
     @campaign = current_client.campaigns.find_by(id: params[:id])
#    @campaigns = @client.campaigns

    end
    
    def create
     @campaign = current_client.campaigns.build(campaign_params)
     if @campaign.save
         if @campaign.startdate > Date.today 
         flash[:success] = "キャンペーン予約登録完了"
        elsif @campaign.startdate == Date.today 
          flash[:success] = "すぐに開始できるかな" 
        elsif @campaign.startdate < Date.today 

            flash[:success] = "取りあえず登録"
         end
         redirect_to @campaign
#         redirect_to request.referrer 
     else
      @campaigns = Campaign.all.order("updated_at DESC").limit(30) if not nil      
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
    
     def edit
      @campaign = Campaign.find(params[:id])
     end
    
     def update
      @campaign = Campaign.find(params[:id])
        if @campaign.update(campaign_params)
           flash[:success] = "update done!"    
            redirect_to request.referrer || root_url
        else
           render 'edit'
        end
     end

    
    
    private
    def campaign_params
        params.require(:campaign).permit(:title,:summary,:content ,:startdate,:enddate,:limage,:image1,:image2,:image3,:image4,:opflg,
        {:category_ids => []})
    end
end


