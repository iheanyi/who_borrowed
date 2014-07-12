class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  def update
    @authentication = current_user.authentictions.find(params[:id])
  end
  def create
    auth = Authentication.from_omniauth(current_user, env["omniauth.auth"])
    flash[:notice] = "Authentication successful"
    redirect_to authentications_url
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully removed authentication."
    redirect_to authentications_url
  end
end
