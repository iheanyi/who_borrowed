module SessionsHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  def signed_in_user
    unless signed_in?
      store_location
      redirect_to login_url, notice: "Please sign in." unless signed_in?
    end
  end

  def signed_in?
    !current_user.nil?
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end
end
