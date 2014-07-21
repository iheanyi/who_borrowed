class ChangeDateFormatInLoan < ActiveRecord::Migration
  def change
    change_column :loans, :loaned_on, :date
    change_column :loans, :return_by, :date
  end
end
