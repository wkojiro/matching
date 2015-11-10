class BrunchesController < ApplicationController
 before_action :logged_in_client, only: [:create,:new,:destoy,:update,:edit]
 
  def show
    @brunch = Brunch.find(params[:id])
  end

  def new
    @brunch = current_client.brunches.build
  end

      
  
  def edit
    @brunch = Brunch.find(params[:id])
  end

  def update
    @brunch = Brunch.find(params[:id])
    if @brunch.update(brunch_params)
      @brunch.save
       flash[:success] = "update!"
      redirect_to @brunch
    else
      render 'edit'
    end
  end
  


  def create
     @brunch = current_client.brunches.build(brunch_params)    
    if @brunch.save
     flash[:success] = "Welcome!"
      redirect_to @brunch
    else
      render 'new'
    end
  end
  def destroy
     @brunch = current_client.brunches.find_by(id: params[:id])
     return redirect_to root_url if @brunch.nil?
     @brunch.destroy
     flash[:success] = "削除しました。"
     redirect_to request.referrer || root_url
  end
  
  private

  def user_params
    params.require(:brunch).permit(:brunchname, :brunchnamefurigana, :brunch_address01,:brunch_address02,:brunch_address03,:brunch_address04,:brunch_station,:brunch_tel,
    :brunch_fax,:brunch_staffname,:brunch_staffnamefurigana,:brunch_staffemail)
  end    
end
