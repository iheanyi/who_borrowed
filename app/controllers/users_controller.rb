class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in @user
      flash[:success] = "Welcome to WhoBorrowed!"
      redirect_to root_url, notice: "Thanks for signing up!"
    else
      render 'new'
    end
  end

  def inventory
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

end
