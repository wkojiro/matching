class ClientSessionsController < ApplicationController
  def new
  end
  
  def create
    @client = Client.find_by(email: params[:client_session][:email].downcase)
    if @client && @client.authenticate(params[:client_session][:password])
      session[:client_id] = @client.id
      flash[:info] = "logged in as #{@client.compname}"
      redirect_to @client
    else
      flash[:danger] = 'invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    session[:client_id] = nil
    redirect_to root_path
  end
end
