module ClientsessionsHelper
  def current_client
    @current_client ||= Client.find_by(id: session[:client_id])
  end

  def client_logged_in?
    !!current_client
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end