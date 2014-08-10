class MailerWorker
  include Sidekiq::Worker

  def perform(user, loan)
      UserMailer.loan_email(user, loan).deliver
  end
end