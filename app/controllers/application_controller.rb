class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include UsersessionsHelper
  include ClientsessionsHelper  
  
  private
  def logged_in_user
    unless logged_in?
    store_location
    flash[:danger] = "Please log in."
    redirect_to user_login_url
    #login_urlで良いのか？
    end
  end
  
   def logged_in_client
    unless logged_in?
    store_location
    flash[:danger] = "Please log in."
    redirect_to client_login_url
    #login_urlで良いのか？
    end
   end
  
end
  
  

