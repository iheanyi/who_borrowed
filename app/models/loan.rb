class Loan < ActiveRecord::Base
  belongs_to :lender, class_name: "User"
  belongs_to :borrower, class_name: "Borrower"
  belongs_to :item


  has_many :loan_reminders

  after_create :build_reminder, if: -> {self.email_me?}
  after_update :destroy_reminder, if: -> {!self.email_me?}


  def item_attributes= p
    build_item p.merge( user: lender )
  end

  def borrower_attributes= p
    build_borrower p.merge( user: lender)
  end

  private
    def build_reminder
      self.loan_reminders.create(user_id: self.lender_id, send_date: self.return_by)
    end
end
