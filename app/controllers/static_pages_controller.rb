class StaticPagesController < ApplicationController
  def index
  #      @user = User.find(params[:id])
  #      @client = Client.find(params[:id])

  #  @campaigns = Campaign.all.order("updated_at DESC").limit(30) if not nil
  @search = Campaign.joins(:categories).all.search(params[:q])
  @campaigns = @search.result
  #@applies = current_user.apllies.build
    @user = current_user
    @client = current_client
  end
  def search

#  @search = Campaign.all.search(params[:q])
#  @campaigns = @search.result

#    @user = current_user
#    @client = current_client
  @search = Campaign.all.search(params[:q])
  @campaigns = @search.result
  #@applies = current_user.apllies.build
    @user = current_user
    @client = current_client


  end
end
