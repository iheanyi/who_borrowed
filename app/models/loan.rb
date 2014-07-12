class Loan < ActiveRecord::Base
  belongs_to :lender, class_name: "User"
  belongs_to :borrower, class_name: "Borrower"
  belongs_to :item
end
