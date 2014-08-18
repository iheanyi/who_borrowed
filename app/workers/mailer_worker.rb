class MailerWorker
  include Sidekiq::Worker

  def perform(user_id, loan_id)
      user = User.find(user_id)
      loan = user.loans.find(loan_id)
      UserMailer.loan_email(user, loan).deliver
  end
end