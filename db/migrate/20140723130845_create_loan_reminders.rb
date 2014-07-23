class CreateLoanReminders < ActiveRecord::Migration
  def change
    drop_table :loan_reminders
    create_table :loan_reminders do |t|
      t.references :user, index: true
      t.references :loan, index: true
      t.date :send_date

      t.timestamps
    end
  end
end
