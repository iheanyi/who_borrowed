class LoansController < ApplicationController
  before_action :signed_in_user, only: [:create, :edit, :update, :destroy]

  def new
    redirect_to root_url, alert: "Please Login" unless signed_in?
    @loan = Loan.new
  end


  def edit
    @loan = current_user.loans.find(params[:id])
  end

  def update
    @loan = current_user.loans.find(params[:id])
  end

  def destroy
    @loan  = Loan.find(params[:id])
    @loan.destroy

    flash[:success] = "Loan successfully removed!"

    redirect_to root_url
  end

  def create
    @loan = current_user.loans.build
    @loan.attributes = loan_params

    if @loan.save
      unless @loan.return_by.nil?
        UserMailer.delay_until(@loan.return_by.to_time(:utc)).loan_email(current_user.id, @loan.id)
      end

      flash[:success] = "Loan Created!"
      redirect_to root_url
    else
      render 'loans/new'
    end
  end

  private
    def loan_params
      params.require(:loan).permit(:loaned_on, :return_by, :unknown_date, :unknown_loan_date, :return_whenever, :email_me,
                                   borrower_attributes: [ :name ], item_attributes: [ :name, :image ])
    end
end
