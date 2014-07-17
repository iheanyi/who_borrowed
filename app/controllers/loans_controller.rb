class LoansController < ApplicationController
  before_action :signed_in_user, only: [:create, :edit, :update, :destroy]

  def new
    redirect_to root_url, alert: "Please Login" unless signed_in?

    @loan = Loan.new
  end

  def edit
  end

  def update
  end

  def create

  end

  private
    def loan_params
      params.require(:loan).permit(:username)
    end
end
