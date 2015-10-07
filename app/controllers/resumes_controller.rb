class ResumesController < ApplicationController
    before_action :logged_in_user, only: [:create]
    
    def new
      @resume = Resume.new

    end 
    
    def show
     #@resume = current_user.build_resume.find_by(id: params[:id])
     @resume = Resume.find(params[:id])if not nil
     @user = User.find(params[:id]) #paramidが同じことをいいことに危険な実装。
    end

    def create
     @resume = current_user.build_resume(resume_params)
     if @resume.save
        flash[:success] = "登録!"
         redirect_to @resume
     else
      @resume = Resume.all.order("updated_at DESC").limit(30) if not nil      
         render 'static_pages/index'
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
      @resume = Resume.find(params[:id])
     end
    
     def update
      @resume = Resume.find(params[:id])
        if @resume.update(resume_params)
           flash[:success] = "update done!"    
            redirect_to request.referrer || root_url
        else
           render 'edit'
        end
     end

    
    private
    def resume_params
        params.require(:resume).permit(:address1,:address2,:tel,:birthday,:sex ,:shikaku,:menkyo)
    end
end

