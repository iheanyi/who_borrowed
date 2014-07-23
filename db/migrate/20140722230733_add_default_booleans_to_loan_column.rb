class AddDefaultBooleansToLoanColumn < ActiveRecord::Migration
  def change
    change_column :loans, :email_me, :boolean, :default => true
    change_column :loans, :return_whenever, :boolean, :default => false
    change_column :loans, :unknown_loan_date, :boolean, :default => false
  end
end
