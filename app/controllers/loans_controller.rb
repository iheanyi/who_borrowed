class LoansController < ApplicationController
  before_action :signed_in_user, only: [:create, :edit, :update, :destroy]

  def new
    redirect_to root_url, alert: "Please Login" unless signed_in?

    @loan = Loan.new
  end


  def edit
    @loan = Loan.find(params[:id])
  end

  def update
    @loan = Loan.find(params[:id])
  end

  def destroy
    @loan  = Loan.find(params[:id])
    @loan.destroy

    redirect_to root_url
  end

  def create
    @loan = current_user.loans.build
    @loan.attributes = loan_params

    if @loan.save
      flash[:success] = "Loan Created!"
      redirect_to root_url
    else
      render 'loans/new'
    end
  end

  def edit
  end

  def update
  end

  private
    def loan_params
      params.require(:loan).permit(:loaned_on, :return_by, :unknown_date, :unknown_loan_date, :return_whenever, :email_me,
                                   borrower_attributes: [ :name ], item_attributes: [ :name, :image ])
    end
end
