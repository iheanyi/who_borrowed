class UserMailer < ActionMailer::Base
  default from: "whoborrowedapp@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://whoborrowed.iheanyi.com/login'
    mail(to: @user.email, subject: 'Welcome to WhoBorrowed!')
  end

  def loan_email(user, loan)
    @user = user
    @loan = loan

    mail(to: @user.email, subject: 'WhoBorrowed Loan Reminder')
  end
end
