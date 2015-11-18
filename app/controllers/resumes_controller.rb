class ResumesController < ApplicationController
    before_action :logged_in_user, only: [:create]
    
    def new
     @user = current_user
     @resume = Resume.new
     @resume.rescats.build # これ！
    end 
    
    def show
     @resume = current_user.build_resume.find_by(id: params[:id])
    # @resume = Resume.find(params[:id])if not nil
    # @user = User.find(params[:id]) #paramidが同じことをいいことに危険な実装。
    end

    def create
     @resume = current_user.build_resume(resume_params)
     if @resume.save
        flash[:success] = "登録!"
        @user = current_user
         redirect_to @user
     else
 #     @resume = Resume.all.order("updated_at DESC").limit(30) if not nil  
       flash[:warning] = "登録出来ておりません。"
      @user = current_user
      redirect_to @user
     end
    end
    
   # def destroy
   #  基本的にはResume単体でDestroyさせることはない  
   #  @resume = Resume.find(params[:id]) if not nil
   #  return redirect_to root_url if @resume.nil?
   #  @resume.destroy
   #  flash[:success] = "Resume deleted"
   #  redirect_to request.referrer || root_url
   # end
    
     def edit
      @user = current_user 
      @resume = Resume.find(params[:id])
     end
    
     def update
      @user = current_user      
      @resume = Resume.find(params[:id])
        if @resume.update(resume_params)
           flash[:success] = "update done!"    
           @user = current_user
            redirect_to @user
        else
           render 'edit'
        end
     end

    
    private
    def resume_params
        params.require(:resume).permit(
        :user_address01,
        :user_address02,
        :user_address03,
        :user_address04,
        :user_postel01,
        :user_postel02,
        :tel,
        :tel02,
        :gradyear,
        :gradschool,
        :graduateyear,
        :status,
        :jikopr,
        :scoutflg,
        :birthday,
        :sex ,
        :skills,
        :wannabe,
        :jobhopcount,
        :jobhistory01,        
        :jobhistorycompname01,
        :jobhistorystartdate01,
        :jobhistoryenddate01,
        :jobhistorykeitai01,
        :jobhistoryoccupation01,
        :jobhistory02,        
        :jobhistorycompname02,
        :jobhistorystartdate02,
        :jobhistoryenddate02,
        :jobhistorykeitai02,
        :jobhistoryoccupation02,
        :jobhistory03,        
        :jobhistorycompname03,
        :jobhistorystartdate03,
        :jobhistoryenddate03,
        :jobhistorykeitai03,
        :jobhistoryoccupation03,
        :skillexperience,
        :skillexperience_futsu,
        :skillexperience_taxi,
        :skillexperience_haier,     
        :skillexperience_rosenbus,
        :skillexperience_ryokyakubus,
        :skillexperience_sonotabus,       
        :skillexperience_kenin,  
        :skillexperience_oogatatruck, 
        :skillexperience_chugatatruck,
        :skillexperience_kogatatruck, 
        :skillexperience_tokusyu,
        :skillexperience_sonota01,  
        :skillexperience_sonota02,
        :shikaku,
        :menkyo,
        {:category_ids => []})
    end
end

