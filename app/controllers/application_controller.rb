class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  # Session Helper Methods
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

  helper_method :current_user
  helper_method :signed_in_user
  helper_method :signed_in?
  helper_method :store_location

end
