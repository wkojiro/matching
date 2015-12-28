class CampaignsController < ApplicationController
    before_action :logged_in_client, only: [:create,:new,:destoy,:update,:edit]
    protect_from_forgery

    def index
     @hws = Hellowork.all
    end
    
    def new
     @campaign = current_client.campaigns.build
     @campaign.campcats.build # これ！
     @hws = Hellowork.new
    end
    
    
    def show
    #  if current_client == @client
    #     @campaign = current_client.campaigns.find_by(id: params[:id])
    #    else

        @campaign =Campaign.find(params[:id])
        @hash = Gmaps4rails.build_markers(@campaign) do |campaign, marker|
         marker.lat campaign.latitude
         marker.lng campaign.longitude
         marker.json({title: campaign.title})
        end
         
        if current_user != nil #この書き方なんかイケてない、、、
          @user = current_user
        end
        if current_client != nil
         @client= current_client
        end
#    @campaigns = @client.campaigns
    if user_logged_in?
      @applies = current_user.applies.build
      
    end
    end
    
    def create
     @campaign = current_client.campaigns.build(campaign_params)
       if @campaign.save
         puts "done"
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
        puts "not saved" 
          @search = Campaign.all.search(params[:q])
          @campaigns = @search.result             
        #  @campaigns = Campaign.all.order("updated_at DESC").limit(30) if not nil      
        # render 'static_pages/index'
         render 'campaigns/new'
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
 #       params.require(:campaign).permit(:title,:summary,:content ,:startdate,:enddate,:limage,:image1,:image2,:image3,:image4,:opflg,
 #       :youtube,:category,:jobtitle01,:jobtitle02,:jobtitle03,:auth,:offce_name,:offce_postel,:offce_address01,:offce_address02,:offce_address03,
 #       :offce_address04,:mycar,:station,:mapinfo,:koyokeitai,:koyokikan,:salary,:salary_remarks,:socialsecurity,:commuting_expenses,:promote,
 #       :retirement_salary,:allowance,:emp_remarks,:worktime,:breaktime,:overtime,:holiday,:annual_holiday,:job_description,:workflow,:licence,
 #       :skill,:qualification,:age_criteria,:in_charge,:apply_tel,:apply_email,:apply_how,:apply_flow,:apply_remarks,{:category_ids => []})
        params.require(:campaign).permit(:title,:summary,:content ,:startdate,:enddate,:limage,:image1,:image2,:image3,:image4,:opflg,
         :youtube,:category,:jobtitle01,:jobtitle02,:jobtitle03,{:auth => []},:office_name,:office_postel,:office_postel02,{:officeaddress => []},:office_address01,:office_address02,:office_address03,
         :office_address04,:mycar,:station,:mapinfo,:howmany,:koyokeitai,:koyokikan,:shouyo,:salary,:salary_remarks,{:socialsecurity => []},:commuting_expenses,:promote,
         :retirement_salary,:allowance,:emp_remarks,:worktime,:breaktime,:overtime,:holiday,:annual_holiday,:job_description,:workflow,:licence,
         :skill,:qualification,:age_criteria,:in_charge,:apply_tel,:apply_email,:apply_how,:apply_flow,:apply_remarks,
        {:category_ids => []})
    end
end
