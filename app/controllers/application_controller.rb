class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def days_ago_in_words(date)
  end

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end

  def current_user=(user)
    @current_user=user
  end

  def current_user
    remember_token = User.digest(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.digest(remember_token))
    @current_user = user
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

  def sign_out
    current_user.update_attribute(:remember_token,
                                  User.digest(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  helper_method :signed_in_user
  helper_method :signed_in?
  helper_method :store_location
  helper_method :sign_in
  helper_method :sign_out
  helper_method :current_user
  helper_method :authorize


end
