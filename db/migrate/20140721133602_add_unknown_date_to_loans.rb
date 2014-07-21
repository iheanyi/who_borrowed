class AddUnknownDateToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :unknown_loan_date, :boolean
  end
end
