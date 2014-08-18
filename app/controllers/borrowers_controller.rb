class BorrowersController < ApplicationController

  def index
  end

  def create
    @borrower = Borrower.new(:borrower_params)
  end

  def destroy
  end



  private
    def borrower_params
      params.require(:borrower).permit(:name)
    end
end
