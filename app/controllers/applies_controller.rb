class AppliesController < ApplicationController
    
    def new
        @applies = Apply.new
    end
    
    def index
        @applies = Apply.all
    end

    def create
        puts "create"
        @applies = current_user.applies.build(apply_params)
        if @applies.save
            flash[:success] = "応募しました！"
        redirect_to request.referrer 
        else
        puts "not saved"
         p @applies.errors
        redirect_to request.referrer 
        end
    end
    
    def show
        @applies = Apply.all
 #   @applies = Apply.find(params[:id])
    end
    def apply_params
    params.require(:apply).permit(:message,:campaign_id)
    end
end


