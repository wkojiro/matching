class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end
  
  def show
    @admin = Admin.find(params[:id])
    @campaigns = Campaign.all.order("updated_at DESC").limit(30) if not nil
  #   @campaigns = Campaign.all.order("updated_at DESC").limit(30) if not nil
  end  
  
  def create
    @admin = Admin.new(admin_params)
    if @admin.save
     flash[:success] = "Welcome Admin World!"      
     redirect_to @admin
    else
      render 'new'
    end
  end

  def edit
  end 
  
  def update
  end   



  private

  def admin_params
    params.require(:admin).permit(:name, :email, :password,
                                 :password_confirmation)
  end
  
end
