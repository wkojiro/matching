class AdminSessionsController < ApplicationController
  def new
  end
  
  def create
    @admin = Admin.find_by(email: params[:admin_session][:email].downcase)
    if @admin && @admin.authenticate(params[:admin_session][:password])
      session[:admin_id] = @admin.id
      flash[:info] = "logged in as #{@admin.name}"
      redirect_to @admin
    else
      flash[:danger] = 'invalid email/password combination'
      render 'new'
    end
  end
  
  def edit
  end 
  
  def update
  end     

  
  def destroy
    session[:admin_id] = nil
    redirect_to root_path
  end 
  
  
  
end
