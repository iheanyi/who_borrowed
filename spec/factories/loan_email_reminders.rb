# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :loan_email_reminder do
    loan nil
    send_date "2014-07-21"
  end
end
