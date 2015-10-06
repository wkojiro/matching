class ResumesController < ApplicationController
    before_action :logged_in_user, only: [:create]
    
    def new
     
     @resume = current_user.resumes.build
    end 
    
    def show
#     @resume = current_user.resumes.find_by(id: params[:id])
    end
    
    def create
     @resume = current_user.resumes.build(resume_params)
     if @resume.save
        flash[:success] = "登録!"
         redirect_to @resume
     else
      @resume = Resume.all.order("updated_at DESC").limit(30) if not nil      
         render 'static_pages/index'
     end
    end
    
    def destroy
     @resume = current_user.resumes.find_by(id: params[:id])
     return redirect_to root_url if @resume.nil?
     @resume.destroy
     flash[:success] = "Resume deleted"
     redirect_to request.referrer || root_url
    end
    
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

