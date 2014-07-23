class RenameLoanEmailReminderToLoanReminder < ActiveRecord::Migration
  def change
    rename_table :loan_email_reminders, :loan_reminders
  end
end
