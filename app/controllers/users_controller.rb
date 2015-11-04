class UsersController < ApplicationController
 
  def show
    @user = User.find(params[:id])
    if Resume.where(user_id: @user.id ).exists?
      @resume = Resume.where(user_id: :id )
      @msg = "履歴書があります。"
    else 
      @msg = "履歴書がありません。"
      @resume = Resume.new
       
    end
  end


  def index
   redirect_to root_path
  end



  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
    if @user.update(user_params)
      @user.save
       flash[:success] = "update!"
      redirect_to @user
    else
      render 'edit'
    end
  end
  


  def create
    @user = User.new(user_params)
    if @user.save
     flash[:success] = "Welcome!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  
  
  
  
  
  

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
