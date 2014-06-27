module SessionsHelper
  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def signed_in?
    !current_user.nil?
  end
end
