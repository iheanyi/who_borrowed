class BorrowersController < ApplicationController

  def create
    @borrower = Borrower.new(:borrower_params)
  end

  def destroy
  end



  private
    def borrower_parmas
      params.require(:borrower).permit(:name)
    end
end
