class SessionsController < ApplicationController
  def new
  end


  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      session[:id] = user.id
      current_user = user
      redirect_to root_url
    else
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    session[:id] = nil
    current_user = nil

    redirect_to root_url
  end
end
