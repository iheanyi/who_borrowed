class CreateLoanEmailReminders < ActiveRecord::Migration
  def change
    create_table :loan_email_reminders do |t|
      t.references :loan, index: true
      t.date :send_date

      t.timestamps
    end
  end
end
