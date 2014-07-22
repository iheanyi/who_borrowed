class Loan < ActiveRecord::Base
  belongs_to :lender, class_name: "User", :dependent => :destroy
  belongs_to :borrower, class_name: "Borrower"
  belongs_to :item

  def item_attributes= p
    build_item p.merge( user: lender )
  end

  def borrower_attributes= p
    build_borrower p.merge( user: lender)
  end
end
