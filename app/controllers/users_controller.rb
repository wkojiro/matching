class UsersController < ApplicationController
 
  def show
    @user = User.find(params[:id])
    if @user.resume.nil? 
       @msg = "まだレジメが作成されておりません。"
    else 
    @resume = Resume.find(params[:id])
    end
  end

  def index
   redirect_to root_path
  end



  def new
    @user = User.new
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
