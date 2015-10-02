class StaticPagesController < ApplicationController
  def index
  #      @user = User.find(params[:id])
  #      @client = Client.find(params[:id])
    @campaigns = Campaign.all.order("updated_at DESC").limit(30) if not nil
    @user = current_user
    @client = current_client

  end
end
