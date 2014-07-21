class AddEmailReminderToLoan < ActiveRecord::Migration
  def change
    add_column :loans, :email_me, :boolean
  end
end
