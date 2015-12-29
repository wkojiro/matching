class StaticPagesController < ApplicationController
  def index
  #      @user = User.find(params[:id])
  #      @client = Client.find(params[:id])

  #  @campaigns = Campaign.all.order("updated_at DESC").limit(30) if not nil
  #  @search = Campaign.joins(:categories).all.search(params[:q])
  @campcount = Campaign.where("opflg = ? and startdate <= ? and enddate >= ?" , 1, Date.today, Date.today ).count
  @search = Campaign.search(params[:q])
  @campaigns = @search.result(distinct: true)
  @hws = Hellowork.all
  @alljobs = @campaigns.concat(@hws)
 # @alljobs.sort{|f,s| f.created_at <=> s.created_at}
  #@applies = current_user.apllies.build
    @user = current_user
    @client = current_client
  end
  def search

#  @search = Campaign.all.search(params[:q])
#  @campaigns = @search.result
#    @user = current_user
#    @client = current_client
  @campcount2 = Campaign.where("opflg = ? and startdate <= ? and enddate >= ?" , 1, Date.today, Date.today )
  @campcount = @campcount2.count
  @hws = Hellowork.all
##User.where("name = ? and email = ?", name, email)
##User.where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight)

  @search = @campcount2.search(params[:q])


#  @search = Campaign.joins(:categories).all.search(params[:q])
  @campaigns = @search.result(distinct: true).page(params[:page]).per(5).order("updated_at DESC")

#  @campaigns = @search.result
  #@applies = current_user.apllies.build
    @user = current_user
    @client = current_client


  end
end
